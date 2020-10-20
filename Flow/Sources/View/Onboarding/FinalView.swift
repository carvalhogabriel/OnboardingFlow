//
//  FinalView.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 19/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class FinalView: UIView {

    // MARK: - Components
    let titleLabel = Label()
    let verticalStackView = VerticalStackView()
    let nameLabel = Label()
    let cpfLabel = Label()
    let emailLabel = Label()
    
    var viewModel: UserViewModel
    
    // MARK: - View Life Cycle
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupComponents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = UserViewModel()
        super.init(coder: coder)
        setupComponents()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupComponents() {
        titleLabel.setup(title: "Obrigado por fazer nosso Onboarding 😊", size: 20)
        verticalStackView.setup(spacing: 8, distribuition: .fillEqually)
        nameLabel.setup(title: "", size: 16)
        cpfLabel.setup(title: "", size: 16)
        emailLabel.setup(title: "", size: 16)
    }

}

// MARK: - UI
extension FinalView {
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(titleLabel)
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(cpfLabel)
        verticalStackView.addArrangedSubview(emailLabel)
        
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            verticalStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
