//
//  FruitTableViewCell.swift
//  FruitApp
//
//  Created by Mavin on 7/13/21.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
