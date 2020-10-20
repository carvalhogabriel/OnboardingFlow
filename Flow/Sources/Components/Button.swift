//
//  Button.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 12/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup(title: String, color: UIColor) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        self.backgroundColor = color
    }
}
