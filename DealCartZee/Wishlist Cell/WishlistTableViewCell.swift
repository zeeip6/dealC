//
//  WishlistTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 29/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class WishlistTableViewCell: UITableViewCell {
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSpecification: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblReviews: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnAddToCart: RoundButton!
    @IBOutlet weak var btnDelete: RoundButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
