//
//  ProductCell.swift
//  Dealcart
//
//  Created by webwerks on 10/4/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        let width = winWidth == 320 ? ((window?.bounds.width)! - 30.0)/2.0 : ((window?.bounds.width)! - 45.0)/2.0
        let frame = CGRect(x: 0, y: 0, width: width, height: width + 46)
//        ( CGSize(width: width, height: width + 60)        
        
        let maskPath = UIBezierPath.init(roundedRect: frame, byRoundingCorners:[.topLeft, .topRight], cornerRadii: CGSize.init(width: 5.0, height: 5.0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = frame
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
       
    }
}
