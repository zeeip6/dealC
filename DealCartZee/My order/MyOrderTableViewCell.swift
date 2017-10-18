//
//  MyOrderTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 06/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

enum Progress {
    case approval
    case processing
    case shipping
    case delivery
}

class MyOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var lblDeliveryDate: UILabel!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var btnApproval: RoundButton!
    @IBOutlet weak var btnProcessing: RoundButton!
    @IBOutlet weak var btnShipping: RoundButton!
    @IBOutlet weak var btnDelivery: RoundButton!
    
    @IBOutlet weak var progressHeight: NSLayoutConstraint!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var progressBar: UIView!
    
    var progress : Progress?
    override func awakeFromNib() {
        super.awakeFromNib()
        callProgress()
        progressBar.layer.cornerRadius = progressBar.frame.size.height / 2.0
    }
    
    func callProgress(){
//        switch progress {
//        case .approval :
//            
//            print("Approved")
//        case .processing :
//            print("Processing")
//        case .shipping:
//            print("shipping")
//        case .delivery:
//            print("Processing")
//        case .none:
//            print("none")
//        }
    }
}
