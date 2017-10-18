//
//  CustomButton.swift
//  DealCartZee
//
//  Created by Webwerks on 28/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class RoundButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white{
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2.0
        clipsToBounds = true
    }
}


