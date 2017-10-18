//
//  CustomView.swift
//  Sail Uday
//
//  Created by webwerks1 on 8/2/17.
//  Copyright © 2017 webwerks1. All rights reserved.
//

import UIKit

/// Class for Custom UIView

@IBDesignable
class CustomView: UIView {
    
    @IBInspectable var cornerRadious: CGFloat = 3.0
        {
        didSet{
            update()
        }
    }
    
    func update()
    {
        self.layer.cornerRadius = cornerRadious
    }
}

/// Class For Custom UITextField

@IBDesignable
class CustomTextField:  UITextField {
    
    // Provides left padding for images
    //    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    //        var textRect = super.leftViewRect(forBounds: bounds)
    //        textRect.origin.x -=  leftPadding
    //        return textRect
    //    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    /* @IBInspectable var borderWidth: CGFloat? {
        didSet {
            updateView()
        }
    }**/
    
    //@IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    
    func updateView() {
        if let image = rightImage {
            borderStyle = UITextBorderStyle.none
            // Setting Image to right side of UitextField
            rightViewMode = UITextFieldViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: (rightImage?.size.width)!, height: (rightImage?.size.height)!))
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
        
        // to add line at the bottom of uitextfield
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.init(red: 0.7882, green: 0.7882, blue: 0.8980, alpha: 1.0).cgColor//UIColor(colorLiteralRed: 0.7882, green: 0.8549, blue: 0.8980, alpha: 1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width * 2, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: color])
    }
}

@IBDesignable
class BoxTextField:  UITextField {
    @IBInspectable
    var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    //@IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable
    var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        let rightPadding: CGFloat = 8.0
        textRect.origin.x = textRect.origin.x - rightPadding
        
        return textRect
    }
    
    func updateView() {
        if let image = rightImage {
            
            self.layer.borderWidth = 0.1
            rightViewMode = UITextFieldViewMode.always
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ((rightImage?.size.width)!), height: (rightImage?.size.height)!))
            imageView.image = image
            imageView.tintColor = color
            rightView = imageView
            
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.init(red: 0.7882, green: 0.7882, blue: 0.8980, alpha: 1.0).cgColor//UIColor(colorLiteralRed: 0.7882, green: 0.8549, blue: 0.8980, alpha: 1.0).cgColor
            
        } else {
            rightViewMode = UITextFieldViewMode.never
            rightView = nil
        }
        
    }
}
/// Class For Custom UIButton

@IBDesignable
class CustomButton: UIButton {
    
    @IBInspectable var newBorderColor: UIColor = UIColor.blue
        {
        didSet{
            update()
        }
    }
    
    @IBInspectable var cornerRadious: CGFloat = 3.0
        {
        didSet{
            update()
        }
    }
    
    func update()
    {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = cornerRadious
        self.layer.borderColor = newBorderColor.cgColor
        
    }
    
}

class RoundedImage: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.width/2.0
        self.layer.masksToBounds = true
    }
}


@IBDesignable
class CustomButtonWithImage: UIButton {
    
    
    // MARK: - Inspectables
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 1.0{
        didSet {
//            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : CGColor = UIColor.white.cgColor {
        didSet{
            self.layer.borderColor = borderColor
        }
    }
    
    
    @IBInspectable var image: UIImage?
    
    @IBInspectable var imgLeftInset: CGFloat = 10.0
    
    @IBInspectable var imgTopInset: CGFloat = 7.0
    
    @IBInspectable var imgBottomInset: CGFloat = 7.0
    
    
    // MARK: - Properties
    var buttonFont: String = "Noto Sans"
    var imgView: UIImageView?
    
    
    // MARK: - View
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
//        if let font = UIFont(name: buttonFont, size: 14.0) {
//            self.titleLabel?.font = font
//        } else {
//            self.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 14.0)
//        }
        
        self.setNeedsLayout()
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if self.image != nil {
            self.imgView = UIImageView(frame: CGRect(x: (self.frame.size.width - self.imgLeftInset), y: self.imgTopInset, width: self.bounds.height - (self.imgTopInset + self.imgBottomInset), height: self.bounds.height - (self.imgTopInset + imgBottomInset)))
            self.imgView!.contentMode = .scaleAspectFit
            self.imgView!.frame.size = CGSize(width: 12, height: 12)
            
            self.imgView!.image = self.image
            self.addSubview(self.imgView!)
            
            if borderWidth > 0{
                let border = CALayer()
                let width = borderWidth
                border.borderColor = UIColor.init(red: 0.7882, green: 0.7882, blue: 0.8980, alpha: 1.0).cgColor
                border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width * 2, height: self.frame.size.height)
                
                border.borderWidth = width
                self.layer.addSublayer(border)
            }
           
            self.layer.masksToBounds = true
        }
    }
}
