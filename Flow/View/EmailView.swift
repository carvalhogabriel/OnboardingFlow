//
//  EmailView.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 16/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class EmailView: UIView {

    // MARK: - Components
    let titleLabel = Label()
    let emailTextField = TextField()
    
    // MARK: - View Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
        setupUI()
    }
    
    // MARK: - Methods
    private func setupComponents() {
        titleLabel.setup(title: "Agora precisamos do seu e-mail", size: 20)
        emailTextField.setup(placeholder: "E-mail", keyboardType: .emailAddress, returnKey: .done)
        emailTextField.delegate = self
    }

}

// MARK: - UI
extension EmailView {
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(titleLabel)
        addSubview(emailTextField)
        
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension EmailView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
