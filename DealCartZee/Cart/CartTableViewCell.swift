//
//  CartTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 29/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnDelete: RoundButton!
    @IBOutlet weak var txtQuantity: UITextField!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var cartView: UIView!
    
    //MARK:- Variables
    var counter: Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        txtQuantity.layer.borderWidth = 0.5
        txtQuantity.layer.borderColor = UIColor.gray.cgColor
        txtQuantity.layer.cornerRadius = txtQuantity.frame.size.height / 2.0
        cartView.layer.cornerRadius = 3.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
}
