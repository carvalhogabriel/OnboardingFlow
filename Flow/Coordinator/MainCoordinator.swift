//
//  MainCoordinator.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 04/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var onFinish: (() -> Void)?
    
    let nameView = NameView()
    let cpfView = CPFView()
    
    let thirdPage: UIView = {
        let thirdPage = UIView()
        thirdPage.backgroundColor = .cyan
        return thirdPage
    }()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let viewController = ViewController(pages: [nameView, cpfView, thirdPage])
        
        viewController.viewDelegate = self
        navigationController.pushViewController(viewController, animated: true)
    }    
    
}

// MARK: - View Delegate
extension MainCoordinator: ViewDelegate {
    func onTapNext() {
        print("next coordinator implementation")
    }
    
    func onTapBack() {
        print("back coordinator implementation")
    }
}
