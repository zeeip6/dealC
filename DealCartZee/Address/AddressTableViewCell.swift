//
//  AddressTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 04/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var addressView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       self.backgroundColor = UIColor.clear
        addressView.layer.cornerRadius = 3.0
    }    
}
