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

    @Preferences(key: PreferencesKeys.isOnboardingDone.rawValue) private var isOnboardingDone = false

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        isOnboardingDone ? openMainViewController() : openOnboardViewController()
    }

    private func openOnboardViewController() {
        let onboardViewController = OnboardViewController(pages: [nameView,
                                                    cpfView,
                                                    emailView,
                                                    finalView])

        onboardViewController.viewModel = userViewModel
        onboardViewController.viewDelegate = self
        navigationController.pushViewController(onboardViewController, animated: true)
    }

    private func openMainViewController() {
        let mainViewController = MainViewController()
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
}

// MARK: - View Delegate
extension MainCoordinator: ViewDelegate {
    func onTapNext(_ isOnboardingDone: Bool) {
        self.isOnboardingDone = isOnboardingDone
        if isOnboardingDone {
            openMainViewController()
        }
    }
    
    func onTapBack() {
        print("back coordinator implementation")
    }
}
