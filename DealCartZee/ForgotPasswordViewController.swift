//
//  ForgotPasswordViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 28/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var txtEmail: UITextField!
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Button Actions
    @IBAction func actionSend(_ sender: Any) {
        if validate(){
            
        }
    }
    @IBAction func actionLogin(_ sender: Any) {
    }
    
    func validate() -> Bool {
        guard txtEmail.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyEmail, presentingVC: self)
            return false
        }
        guard txtEmail.isValidEmail() else{
            Constant.showAlertWithMessage(message: CommonStrings.validEmail, presentingVC: self)
            return false
        }
        return true
    }
    
}
