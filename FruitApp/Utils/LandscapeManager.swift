//
//  LandscapeManager.swift
//  FruitApp
//
//  Created by Mavin on 7/12/21.
//

import Foundation


class LandscapeManager {
    static let shared = LandscapeManager()
    var isFirstLaunch: Bool {
        get {
            !UserDefaults.standard.bool(forKey: #function)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: #function)
        }
    }
}
