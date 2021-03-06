//
//  FavesCell.swift
//  XCHAT
//
//  Created by Mateo Garcia on 5/21/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

class FavesCell: UITableViewCell {

    @IBOutlet weak var numFavesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(photo: NSMutableDictionary?) {
        if let numFaves = photo?.valueForKey("numFaves") as? Int {
            numFavesLabel.text = "\(numFaves) faves"
        }
    }
    
}
