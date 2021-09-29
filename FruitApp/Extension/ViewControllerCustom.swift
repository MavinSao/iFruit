//
//  ViewControllerCustom.swift
//  FruitApp
//
//  Created by Mavin on 7/13/21.
//

import Foundation
import UIKit

extension UIViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}
