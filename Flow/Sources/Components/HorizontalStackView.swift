//
//  HorizontalStackView.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 12/06/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

class HorizontalStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(spacing: CGFloat, distribuition: UIStackView.Distribution) {
        self.axis = .horizontal
        self.spacing = spacing
        self.distribution = distribution
    }

}
