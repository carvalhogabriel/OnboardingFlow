//
//  Preferences.swift
//  Flow
//
//  Created by Gabriel Carvalho Guerrero on 08/10/20.
//  Copyright © 2020 Gabriel Carvalho Guerrero. All rights reserved.
//

import Foundation

enum PreferencesKeys: String {
    case isOnboardingDone
}

@propertyWrapper
class Preferences<T> {
    let defaults: UserDefaults = .standard
    let key: String
    let defaultValue: T

    var wrappedValue: T {
        get { defaults.object(forKey: key) as? T ?? defaultValue }
        set { defaults.set(newValue, forKey: key) }
    }

    init(wrappedValue: T, key: String) {
        self.defaultValue = wrappedValue
        self.key = key
    }

}
