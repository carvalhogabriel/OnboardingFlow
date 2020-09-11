//
//  SizesEnum.swift
//  FlowTests
//
//  Created by Gabriel Carvalho Guerrero on 08/09/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import UIKit

enum SizesEnum: Int {

    case iphone11ProMax,
    iphoneXSMax,
    iphone11,
    iphoneXR,
    iphone11Pro,
    iphoneX,
    iphoneXS,
    iphone6Plus,
    iphone6sPlus,
    iphone7Plus,
    iphone8Plus,
    iphone6,
    iphone6s,
    iphone7,
    iphone8

    private var height: Int {
        switch self {
        case .iphone11ProMax, .iphoneXSMax, .iphone11, .iphoneXR:
            return 896
        case .iphone11Pro, .iphoneX, .iphoneXS:
            return 812
        case .iphone6Plus, .iphone6sPlus, .iphone7Plus, .iphone8Plus:
            return 736
        case .iphone6, .iphone6s, .iphone7, .iphone8:
            return 667
        }
    }

    private var width: Int {
        switch self {
        case .iphone11ProMax, .iphoneXSMax, .iphone11, .iphoneXR, .iphone6Plus, .iphone6sPlus, .iphone7Plus, .iphone8Plus:
            return 414
        case .iphone11Pro, .iphoneX, .iphoneXS, .iphone6, .iphone6s, .iphone7, .iphone8:
            return 375
        }
    }

    var sizes: CGSize {
        switch self {
        case .iphone11ProMax,
        .iphoneXSMax,
        .iphone11,
        .iphoneXR,
        .iphone11Pro,
        .iphoneX,
        .iphoneXS,
        .iphone6Plus,
        .iphone6sPlus,
        .iphone7Plus,
        .iphone8Plus,
        .iphone6,
        .iphone6s,
        .iphone7,
        .iphone8:
            return CGSize(width: self.width, height: self.height)
        }
    }
}
