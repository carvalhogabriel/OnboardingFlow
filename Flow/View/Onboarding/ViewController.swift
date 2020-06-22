//
//  ViewController.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 04/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

protocol ViewDelegate: class {
    func onTapNext()
    func onTapBack()
}
class ViewController: CustomNavigationViewController {

    // MARK: - Components
    let progressView = ProgressView()
    let nextButton = Button()
    let buttonStackView = HorizontalStackView()
    let scrollView = ScrollView()
    
    var currentPage: Int = 0
    var currentProgress: Float = 1.0
    
    weak var viewDelegate: ViewDelegate?
    weak var viewModel: UserViewModel?
    
    var pages: [UIView]
    
    // MARK: - View Life Cycle
    init(pages: [UIView]) {
        self.pages = pages
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.pages = []
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationDelegate = self
        
        setupComponents()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressView.setProgress(Float(currentProgress) / Float(pages.count), animated: true)
        setupScrollViewFrame()
        addPagesInScrollView()
    }
    
    // MARK: - @objc Private Methods
    @objc
    private func onTapNextButton(_ sender: Button) {
        switch currentPage {
        case OnboardingPagesEnum.name.rawValue:
            showBackButton()
            scrollToPage(page: OnboardingPagesEnum.cpf.rawValue, animated: true)
        case OnboardingPagesEnum.cpf.rawValue:
            scrollToPage(page: OnboardingPagesEnum.email.rawValue, animated: true)
        case OnboardingPagesEnum.email.rawValue:
            scrollToPage(page: OnboardingPagesEnum.final.rawValue, animated: true)
            guard let finalView = pages[OnboardingPagesEnum.final.rawValue] as? FinalView else { return }
            finalView.nameLabel.text = "Nome: \(viewModel?.nameViewModel.name ?? "")"
            finalView.cpfLabel.text = "CPF:\(viewModel?.cpfViewModel.cpf ?? "")"
            finalView.emailLabel.text = "Email: \(viewModel?.emailViewModel.email ?? "")"
        case OnboardingPagesEnum.final.rawValue:
            viewDelegate?.onTapNext()
        default:
            print("unrecognized page")
        }
    }
    
    // MARK: - Private Methods
    private func setupComponents() {
        progressView.setup(progressColor: .systemYellow, trackColor: .systemFill)
        
        scrollView.setup()
        scrollView.delegate = self
        
        nextButton.setup(title: "Next", color: .systemYellow)
        nextButton.addTarget(self, action: #selector(onTapNextButton(_:)), for: .touchUpInside)
    }
}

// MARK: - CustomNavigationControllerDelegate
extension ViewController: CustomNavigationControllerDelegate {
    func onTapBack() {
        switch currentPage {
        case OnboardingPagesEnum.name.rawValue:
            viewDelegate?.onTapBack()
        case OnboardingPagesEnum.cpf.rawValue:
            hideBackButton()
            scrollToPage(page: OnboardingPagesEnum.name.rawValue, animated: true)
        case OnboardingPagesEnum.email.rawValue:
            scrollToPage(page: OnboardingPagesEnum.cpf.rawValue, animated: true)
        case OnboardingPagesEnum.final.rawValue:
            scrollToPage(page: OnboardingPagesEnum.email.rawValue, animated: true)
        default:
            print("unrecognized page")
        }
    }
}

// MARK: - UI
extension ViewController {
    func setupUI() {
        scrollView.dismissKeyboardOnTap()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(progressView)
        
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(nextButton)
        
        view.addSubview(scrollView)
        
        view.subviews.forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor),
            
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupScrollViewFrame() {
        scrollView.frame = CGRect(x: scrollView.frame.minX,
                                  y: scrollView.frame.minY,
                                  width: view.frame.width,
                                  height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: scrollView.frame.height)
    }
    
    func addPagesInScrollView() {
        for index in 0 ..< pages.count {
            pages[index].frame = CGRect(x: scrollView.frame.width * CGFloat(index),
                                        y: 0,
                                        width: scrollView.frame.width,
                                        height: scrollView.frame.height)
            scrollView.addSubview(pages[index])
        }
    }
    
    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        scrollView.scrollRectToVisible(frame, animated: animated)
    }
}

// MARK: - UISCrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / view.frame.width)
        currentPage = Int(pageNumber)
        currentProgress = Float(pageNumber + 1)
        progressView.setProgress(Float(currentProgress) / Float(pages.count), animated: true)
    }
}

// MARK: - UIView Dismiss Keyboard
extension UIView {
    func dismissKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
