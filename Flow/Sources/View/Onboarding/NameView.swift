//
//  NameView.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 16/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class NameView: UIView {

    // MARK: - Components
    let titleLabel = Label()
    let subTitleLabel = Label()
    let titleStackView = VerticalStackView()
    let nameTextField = TextField()
    
    var viewModel: NameViewModel
    
    // MARK: - View Life Cycle
    init(viewModel: NameViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupComponents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        viewModel = NameViewModel(name: "")
        super.init(coder: coder)
        setupComponents()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupComponents() {
        titleLabel.setup(title: "Olá, bem-vindo ao Onboarding", size: 20)
        subTitleLabel.setup(title: "Digite o seu nome para começar", size: 16)
        titleStackView.setup(spacing: 8, distribuition: .fillEqually)
        nameTextField.setup(placeholder: "Name", keyboardType: .default, returnKey: .done)
        nameTextField.delegate = self
    }
}

// MARK: - UI
extension NameView {
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subTitleLabel)
        addSubview(nameTextField)
        
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            nameTextField.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: titleStackView.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: titleStackView.trailingAnchor),
        ])
    }
}

// MARK: - UITextFieldDelegate
extension NameView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        viewModel.name = textField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
