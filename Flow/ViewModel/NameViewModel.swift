//
//  NameViewModel.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 19/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import Foundation

class NameViewModel {
    var name: String
    
    init(name: String) {
        self.name = name
    }

    public func fetchRemoteName(completion: @escaping ((String) -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.name = "Jonatha"
            completion(self.name)
        }
    }
}
