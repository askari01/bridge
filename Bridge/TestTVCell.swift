//
//  TestTVCell.swift
//  Bridge
//
//  Created by Syed Askari on 10/24/17.
//  Copyright © 2017 TechEase. All rights reserved.
//

import UIKit

class TestTVCell: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var button1: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.white.cgColor
        
        image1.image = UIImage(named: "banner")
        image1.tintColor = UIColor.orange
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
