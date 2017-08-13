//
//  TItleDetailTableViewCell.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/12/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import UIKit

class TitleDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public var data: BaseObject? {
        didSet {
            if let d = data {
                titleLabel.text = d.name
                descriptionLabel.text = d.desctription
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
