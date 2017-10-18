//
//  VendorTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 16/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class VendorTableViewCell: UITableViewCell {

    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var viewBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        viewBg.layer.cornerRadius = 5.0
        viewBg.layer.shadowColor = UIColor.lightGray.cgColor
        
        viewBg.layer.shadowOffset = CGSize(width:0, height:3)
        viewBg.layer.shadowOpacity = 1
        viewBg.layer.shadowRadius = 3.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
