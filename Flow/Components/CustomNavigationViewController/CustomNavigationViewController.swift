//
//  CustomNavigationViewController.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 04/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

protocol CustomNavigationControllerDelegate: class {
    func onTapBack()
}
class CustomNavigationViewController: UIViewController {
    
    // MARK: - Public Variables
    public weak var navigationDelegate: CustomNavigationControllerDelegate?
    public var navigationBarStyle: CustomNavigationBarStyle?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarColors()
        
        switch navigationBarStyle {
        case .titleView:
            setupTitleView()
        case .backButtonAndTitleView:
            setupTitleView()
            setupBackButton()
        default:
            setupTitleView()
        }
    }
    
    // MARK: - Private Methods
    private func setupNavigationBarColors() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .systemBackground
    }
    
    private func setupTitleView() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "logoSmall",
                                                              in: Bundle(for: CustomNavigationViewController.self),
                                                              compatibleWith: nil))
    }
    
    private func setupBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "backButton")?.withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.addTarget(self, action: #selector(onTapBackButton(_:)), for: .touchUpInside)
        backButton.imageView?.tintColor = .label
        let leftItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    // MARK: - @objc Private Methods
    @objc
    private func onTapBackButton(_ sender: UIBarButtonItem) {
        navigationDelegate?.onTapBack()
    }
    
    // MARK: - Public Methods
    func showBackButton() {
        setupBackButton()
        
        self.navigationItem.leftBarButtonItem?.customView?.alpha = 0.0
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationItem.leftBarButtonItem?.customView?.alpha = 1.0
        })
    }
    
    func hideBackButton() {
        UIView.animate(withDuration: 0.3, animations: {
            self.navigationItem.leftBarButtonItem?.customView?.alpha = 0.0
        }) { (_) in
            self.navigationItem.leftBarButtonItem = nil
        }
    }
}
