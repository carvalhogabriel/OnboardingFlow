//
//  UserViewModel.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 19/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import Foundation

class UserViewModel {
    var nameViewModel: NameViewModel
    var cpfViewModel: CPFViewModel
    var emailViewModel: EmailViewModel
    
    init() {
        self.nameViewModel = NameViewModel(name: "")
        self.cpfViewModel = CPFViewModel(cpf: "")
        self.emailViewModel = EmailViewModel(email: "")
    }
}
