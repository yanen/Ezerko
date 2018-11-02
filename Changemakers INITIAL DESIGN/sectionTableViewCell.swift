//
//  sectionTableViewCell.swift
//  Changemakers_Designer_View
//
//  Created by Ler Yan En on 20/7/18.
//  Copyright © 2018 KWJX. All rights reserved.
//

import UIKit

class sectionTableViewCell: UITableViewCell {

    @IBOutlet var displayingimagee: UIImageView!
    @IBOutlet var disppllllabe: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func prepareForReuse() {
        displayingimagee.image = nil
        disppllllabe.text = nil
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

