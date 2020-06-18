//
//  CPFView.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 16/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class CPFView: UIView {

    let titleLabel = Label()
    let cpfTextField = TextField()
    
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
        titleLabel.setup(title: "Agora digite seu CPF", size: 20)
        cpfTextField.setup(placeholder: "CPF", keyboardType: .numberPad, returnKey: .done)
        cpfTextField.delegate = self
    }
}

// MARK: - UI
extension CPFView {
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(titleLabel)
        addSubview(cpfTextField)
        
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            cpfTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            cpfTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            cpfTextField.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension CPFView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
