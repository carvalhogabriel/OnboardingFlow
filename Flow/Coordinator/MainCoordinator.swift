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
    let emailView = EmailView()
    let finalView = FinalView()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let viewController = ViewController(pages: [nameView, cpfView, emailView, finalView])
        
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
