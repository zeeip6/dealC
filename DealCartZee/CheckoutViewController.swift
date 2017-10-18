//
//  CheckoutViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 05/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class CheckoutViewController: CustomViewController, CustomDropDownViewDelegate {
    func selectedInfo(index: Int) {
        print(index)
    }
    //MARK:- Outlets
    @IBOutlet weak var txtFirstName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtLastName: SkyFloatingLabelTextField!
    @IBOutlet weak var txtAddress: SkyFloatingLabelTextField!
    @IBOutlet weak var txtContact: SkyFloatingLabelTextField!
    @IBOutlet weak var txtZipCode: SkyFloatingLabelTextField!
    @IBOutlet weak var btnCity: CustomButtonWithImage!
    @IBOutlet weak var btnState: CustomButtonWithImage!
    @IBOutlet weak var btnCountry: CustomButtonWithImage!
    @IBOutlet weak var btnContinuePayment: UIButton!
    @IBOutlet weak var viewNewAddress: UIView!
    @IBOutlet weak var viewNewAddressHeight: NSLayoutConstraint!
    
    //MARK:- Variables
    var height : CGFloat!
    var btnAddressArea : [String:String] = ["City": "","State":"","Country":""]
    var cityDropDown = DropDown()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        height = viewNewAddressHeight.constant
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
    }
    
    //MARK:- Buttons Actions
    @IBAction func actionContinuePayment(_ sender: Any) {
        if validate(){
            let checkoutPayment = self.storyboard?.instantiateViewController(withIdentifier: "PayOutViewController")
            self.navigationController?.pushViewController(checkoutPayment!, animated: true)
        }
    }
    @IBAction func actionCity(_ sender: UIButton) {
        let dataSource = ["Mumbai", "Chennai", "Kolkatta", "Delhi","Jaipur", "Navi Mumbai"]
        cityDropDown.anchorView = btnCity // UIView or UIBarButtonItem
        cityDropDown.dataSource = dataSource
        cityDropDown.width = btnCity.frame.size.width
        cityDropDown.bottomOffset = CGPoint(x: 0, y: btnCity.bounds.height)
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.btnCity.setTitle(item, for: UIControlState.normal)
            self.btnAddressArea["City"] = dataSource[index]
            print("Selected item: \(item) at index: \(index)")
        }
        cityDropDown.show()
        
    }
    @IBAction func actionState(_ sender: UIButton) {
        let dataSource = ["Maharashtra", "Delhi", "Tamil Nadu", "Rajastan", "Kerala"]
        cityDropDown.anchorView = btnState // UIView or UIBarButtonItem
        cityDropDown.dataSource = dataSource
        cityDropDown.width = btnCity.frame.size.width
        cityDropDown.bottomOffset = CGPoint(x: 0, y: btnState.bounds.height)
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.btnState.setTitle(item, for: UIControlState.normal)
            self.btnAddressArea["State"] = dataSource[index]
            
        }
        cityDropDown.show()
    }
    @IBAction func actionCountry(_ sender: UIButton) {
        let dataSource = ["India"]
        cityDropDown.anchorView = btnCountry // UIView or UIBarButtonItem
        cityDropDown.dataSource = dataSource
        cityDropDown.width = btnCity.frame.size.width
        cityDropDown.bottomOffset = CGPoint(x: 0, y: btnCountry.bounds.height)
        cityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.btnCountry.setTitle(item, for: UIControlState.normal)
            self.btnAddressArea["Country"] = dataSource[index]
            print("Selected item: \(item) at index: \(index)")
        }
        cityDropDown.show()
    }
    
    @IBAction func actionDefaultBillingAddress(_ sender: UIButton) {
    }
    @IBAction func actionDefaultShippingAddress(_ sender: UIButton) {
    }
    
    @IBAction func actionSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.title = "Checkout"
            UIView.animate(withDuration: 0.5, animations: {
                self.viewNewAddressHeight.constant = self.height
                self.btnContinuePayment.setTitle("CONTINUE TO PAYMENT", for: UIControlState.normal)
                self.view.layoutIfNeeded() }, completion: { _ in
                    self.viewNewAddress.isHidden = false
            })
        }
            
        else {
            self.title = "Edit Address"
            UIView.animate(withDuration: 0.5, animations: {
                self.viewNewAddressHeight.constant = 0
                self.btnContinuePayment.setTitle("SAVE", for: UIControlState.normal)
                self.view.layoutIfNeeded() }, completion: { _ in self.viewNewAddress.isHidden = true })
        }
    }
    
    //MARK:- Class Methods
    func validate() -> Bool {
        guard txtFirstName.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyFirstName, presentingVC: self)
            return false
        }
        guard txtLastName.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyLastName, presentingVC: self)
            return false
        }
        guard txtAddress.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyAddress, presentingVC: self)
            return false
        }
        guard txtContact.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyPhone, presentingVC: self)
            return false
        }
        guard txtZipCode.isNotEmpty() else{
            Constant.showAlertWithMessage(message: CommonStrings.emptyZipcode, presentingVC: self)
            return false
        }
        guard btnCity.titleLabel?.text != "" else {
            Constant.showAlertWithMessage(message: CommonStrings.selectCity, presentingVC: self)
            return false
        }
        guard btnState.titleLabel?.text != "" else {
            Constant.showAlertWithMessage(message: CommonStrings.selectState, presentingVC: self)
            return false
        }
        guard btnCountry.titleLabel?.text != "" else {
            Constant.showAlertWithMessage(message: CommonStrings.selectCountry, presentingVC: self)
            return false
        }
        return true
    }
}
