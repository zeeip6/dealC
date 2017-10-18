//
//  VendorDetailCell.swift
//  DealCartZee
//
//  Created by Webwerks on 13/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class VendorDetailCell: UITableViewCell {

    @IBOutlet weak var lblVendorName: UILabel!
    @IBOutlet weak var btnWriteAReview: UIButton!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblSalesDetail: UILabel!
    @IBOutlet weak var imgVendor: UIImageView!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
