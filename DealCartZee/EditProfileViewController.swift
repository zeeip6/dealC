//
//  EditProfileViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 28/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class EditProfileViewController: CustomViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtCurrentPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnChangePassword: UIButton!
    
    //MARK: - Variables
    var passViewHeight: CGFloat?
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passViewHeight = passwordViewHeight.constant
        passwordView.isHidden = true
        passwordViewHeight.constant = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let leftBarBtn = UIBarButtonItem(image: UIImage(named: "back_forgotpassword"), style: .plain, target: self, action: #selector(backClicked))
        self.navigationItem.leftBarButtonItem = leftBarBtn
    }
    
    //MARK: - Button Actions
    
    @IBAction func actionChangePassword(_ sender: Any) {
        if passwordView.isHidden {
            
            UIView.animate(withDuration: 0.5){
                self.passwordViewHeight.constant = self.passViewHeight!
                self.view.layoutIfNeeded()
                self.passwordView.isHidden = false
            }
            btnChangePassword.alpha = 1.0
        }
        else {

            UIView.animate(withDuration: 0.5, animations: { self.passwordViewHeight.constant = 0
                self.view.layoutIfNeeded() }, completion: { x in self.passwordView.isHidden = true })
            btnChangePassword.alpha = 0.5
        }
    }
    @IBAction func actionSave(_ sender: Any) {
        if validate() {
            
        }
    }
    
    @IBAction func actionBacktoAccount(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    //MARK:- Class custom Methods
    func validate() -> Bool {
        guard txtFirstName.isNotEmpty() else {
            Constant.showAlertWithMessage(message: CommonStrings.emptyFirstName, presentingVC: self)
            return false
        }
        guard txtFirstName.isValidName() else {
            Constant.showAlertWithMessage(message: CommonStrings.validFirstName, presentingVC: self)
            return false
        }
        guard txtLastName.isNotEmpty() else {
            Constant.showAlertWithMessage(message: CommonStrings.emptyLastName, presentingVC: self)
            return false
        }
        guard txtLastName.isValidName() else {
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
        if !(passwordView.isHidden){
            guard txtCurrentPassword.isNotEmpty() else {
                Constant.showAlertWithMessage(message: CommonStrings.emptyPassword, presentingVC: self)
                return false
            }

            guard txtNewPassword.isNotEmpty() else {
                Constant.showAlertWithMessage(message: CommonStrings.emptyNewPassword, presentingVC: self)
                return false
            }
            guard txtNewPassword.isValidPassword() else {
                Constant.showAlertWithMessage(message: CommonStrings.validNewPassword, presentingVC: self)
                return false
            }
            guard txtConfirmPassword.isNotEmpty() else {
                Constant.showAlertWithMessage(message: CommonStrings.emptyConfirmPassword, presentingVC: self)
                return false
            }
            guard txtNewPassword.text == txtConfirmPassword.text else {
                Constant.showAlertWithMessage(message: CommonStrings.passwordMismatch, presentingVC: self)
                return false
            }
        }
        return true
    }
    
    @objc func backClicked(){
        self.navigationController?.popViewController(animated: true)
    }
}
