//
//  CategoryCollectionViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 03/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgCategory.layer.cornerRadius = imgCategory.frame.size.height / 2
    }
}
