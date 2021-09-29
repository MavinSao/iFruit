//
//  MainPageViewController.swift
//  FruitApp
//
//  Created by Mavin on 7/12/21.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    // MARK: - UI Elements
    private var viewControllerList: [UIViewController] = {
        let storyboard = UIStoryboard.onboarding
        let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstStepVC")
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondStepVC")
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdStepVC")
        return [firstVC, secondVC, thirdVC]
    }()
    
    // MARK: - Properties
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setViewControllers([viewControllerList[0]], direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: - Functions
    func pushNext() {
        if currentIndex + 1 < viewControllerList.count {
          self.setViewControllers([self.viewControllerList[self.currentIndex + 1]], direction: .forward, animated: true, completion: nil)
            currentIndex += 1
        }
    }
    

   

}
