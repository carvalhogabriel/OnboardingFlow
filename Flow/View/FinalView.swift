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
        titleLabel.setup(title: "Obrigado por fazer nosso Onboarding 😊", size: 20)
    }

}

// MARK: - UI
extension FinalView {
    private func setupUI() {
        backgroundColor = .systemBackground
        
        addSubview(titleLabel)
        
        subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}
