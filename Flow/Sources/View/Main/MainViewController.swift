//
//  MainViewController.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 08/10/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Components
    let helloWorldLabel = Label()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setupUI()
    }

    private func setupComponents() {
        helloWorldLabel.setup(title: "Hellow World! 🌎", size: 32)
    }

}

// MARK: - UI
extension MainViewController {
    private func setupUI() {
        view.backgroundColor = .systemYellow

        view.addSubview(helloWorldLabel)

        view.subviews.forEach { element in
            element.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            helloWorldLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            helloWorldLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
}
