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
    
    let userViewModel = UserViewModel()
    
    lazy var nameView = NameView(viewModel: userViewModel.nameViewModel)
    lazy var cpfView = CPFView(viewModel: userViewModel.cpfViewModel)
    lazy var emailView = EmailView(viewModel: userViewModel.emailViewModel)
    lazy var finalView = FinalView(viewModel: userViewModel)
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let viewController = ViewController(pages: [nameView,
                                                    cpfView,
                                                    emailView,
                                                    finalView])
        
        viewController.viewModel = userViewModel
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
