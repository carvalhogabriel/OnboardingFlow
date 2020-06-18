//
//  Label.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 17/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setup(title: String, size: CGFloat) {
        self.text = title
        self.font = UIFont.systemFont(ofSize: size)
        self.numberOfLines = 0
    }
}
