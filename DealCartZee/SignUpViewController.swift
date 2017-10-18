//
//  SignUpViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 28/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class SignUpViewController: CustomViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnNewsletterCheckBox: UIButton!
    
    //MARK: - Variables
    var newletterSelected: Bool = false
    
    //MARK: - Lifecyle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNewsletterCheckBox.imageView?.frame.size = CGSize(width: 15, height: 15)
        
    }
    
    //MARK: - Actions
    @IBAction func actionNewsletterCheckBox(_ sender: Any) {
        if !newletterSelected {
            btnNewsletterCheckBox.setImage(UIImage(named: "selectedcheckbox"), for: .normal)
            newletterSelected = true
            
        }
        else {
            btnNewsletterCheckBox.setImage(UIImage(named: "Subscribeto_newsletter_signup"), for: .normal)
            newletterSelected = false
        }
    }
    @IBAction func actionSave(_ sender: Any) {
        
        let wishlistController = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController")
        self.navigationController?.pushViewController(wishlistController!, animated: true)
    }
    @IBAction func actionSignIn(_ sender: Any) {
    }
    
    //MARK:- Class custom Methods
    func validate() -> Bool {
        guard txtFirstName.isNotEmpty() else {
            Constant.showAlertWithMessage(message: CommonStrings.emptyFirstName, presentingVC: self)
            return false
        }
        guard txtFirstName.isValidName() else{
            Constant.showAlertWithMessage(message: CommonStrings.validFirstName, presentingVC: self)
            return false
        }
        guard txtLastName.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyLastName, presentingVC: self)
            return false
        }
        guard txtLastName.isValidName() else{
            Constant.showAlertWithMessage(message: CommonStrings.validLastName, presentingVC: self)
            return false
        }
        guard txtEmail.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyEmail, presentingVC: self)
            return false
        }
        guard txtEmail.isValidEmail() else{
            Constant.showAlertWithMessage(message: CommonStrings.validEmail, presentingVC: self)
            return false
        }
        guard txtPassword.isNotEmpty() else {
            Constant.showAlertWithMessage(message: CommonStrings.emptyPassword, presentingVC: self)
            return false
        }
        guard txtPassword.isValidPassword() else {
            Constant.showAlertWithMessage(message: CommonStrings.validPassword, presentingVC: self)
            return false
        }
        guard txtConfirmPassword.isNotEmpty() else {
             Constant.showAlertWithMessage(message: CommonStrings.emptyConfirmPassword, presentingVC: self)
            return false
        }
        guard txtPassword.text == txtConfirmPassword.text else {
            Constant.showAlertWithMessage(message: CommonStrings.passwordMismatch, presentingVC: self)
            return false
        }
        
        return true
    }
}
