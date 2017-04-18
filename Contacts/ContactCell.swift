//
//  ContactCell.swift
//  Contacts
//
//  Created by Dan Lindsay on 2017-04-17.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
