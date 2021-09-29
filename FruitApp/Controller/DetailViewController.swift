//
//  DetailViewController.swift
//  FruitApp
//
//  Created by Mavin on 7/13/21.
//

import UIKit

class DetailViewController: UIViewController, ViewFruit {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    var titleF:String?
    var headingF:String?
    var descriptionF:String?
    var thumnailF:UIImage?
    var backColor: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titleF
        self.headlineLabel.text = headingF
        self.descriptionLabel.text = descriptionF
        self.thumbnail.image = thumnailF
        self.thumbnail.backgroundColor = UIColor(named: backColor!)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = .black
        // Do any additional setup after loading the view.
    }
    
    
    
    func onViewData(fruit: Fruit) {
        self.titleF = fruit.title
        self.headingF = fruit.headline
        self.descriptionF = fruit.description
        self.backColor = fruit.gradientColors[1]
        self.thumnailF = UIImage(named: fruit.image)
    }

}
