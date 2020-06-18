//
//  Coordinator.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 04/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var onFinish: (() -> Void)? { get set }
    
    // All coordinators will be initialized with a navigation controller
    init(navigationController: UINavigationController)
    
    func start()
}

extension Coordinator {
    
    func addChild(_ coordinator: Coordinator) {
        let contains = childCoordinators.contains { $0 === coordinator }
        if !contains { childCoordinators.append(coordinator)}
    }
    
    func removeChild(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
}
