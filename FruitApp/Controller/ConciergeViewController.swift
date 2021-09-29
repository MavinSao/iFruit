//
//  ConciergeViewController.swift
//  FruitApp
//
//  Created by Mavin on 7/12/21.
//

import UIKit

class ConciergeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if LandscapeManager.shared.isFirstLaunch {
            print("==>Will")
               performSegue(withIdentifier: "toOnboarding", sender: nil)
               LandscapeManager.shared.isFirstLaunch = true
           } else {
               performSegue(withIdentifier: "toMain", sender: nil)
        }
    }
}
