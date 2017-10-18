//
//  PayOutViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 05/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class PayOutViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var paymentTableView: UITableView!
    @IBOutlet weak var txtCuponCode: UITextField!
    @IBOutlet weak var lblTotalAmount: UILabel!
    
    //MARK:- Variables
    var footerView: UIView! = UIView()
    var titles: [[String:Any]] = [["title" : "Cash on Deliver", "icon" : "CashOnDelivery_checkout2"], ["title" : "E Wallet", "icon" : "E-wallet_checkout2"], ["title" : "Credit Card","icon" : "creditcard_chekout(payment)"], ["title": "Debit Card", "icon": "debitcard_checkout2"],["title": "Internet Banking", "icon" : "InternetBanking_checkout2"]]
    var selectedPaymentMethod : Int?
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
        footerView.frame.size = CGSize(width: self.view.frame.size.width, height: 0)
        paymentTableView.tableFooterView = footerView
        paymentTableView.register(UINib(nibName: "PaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "paymentCell")
    }
    //MARK:- Actions
    @IBAction func actionApply(_ sender: Any) {
    }
    @IBAction func actionConfirmation(_ sender: Any) {
    }
}

extension PayOutViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell") as! PaymentTableViewCell
        cell.lblTitle.text = (titles[indexPath.row])["title"] as?   String
        cell.imgLogo.image = UIImage(named: (titles[indexPath.row])["icon"] as! String)
        
        if indexPath.row == selectedPaymentMethod {
            cell.imgCheckbox.image = UIImage(named: "radiobutton_checkout2")
            cell.imgLogo.image = cell.imgLogo?.image?.withRenderingMode(.alwaysTemplate)
            cell.imgLogo.tintColor = UIColor(red: 55/255.0, green: 71/255.0, blue: 157/255.0, alpha: 1.0)
        }
        else {
             cell.imgCheckbox.image = UIImage(named: "radiobutton2_checkout2")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPaymentMethod = indexPath.row
        tableView.reloadData()
    }
}
