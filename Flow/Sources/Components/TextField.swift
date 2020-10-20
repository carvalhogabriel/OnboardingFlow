//
//  TextField.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 17/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class TextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(placeholder: String, keyboardType: UIKeyboardType, returnKey: UIReturnKeyType) {
        borderStyle = .roundedRect
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKey
    }

}
