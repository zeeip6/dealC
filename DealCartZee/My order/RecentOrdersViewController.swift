//
//  RecentOrdersViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 06/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class RecentOrdersViewController: UIViewController {

    @IBOutlet weak var recentOrderTableView: UITableView!
    @IBOutlet var footerView: UIView!
    var tableData : [[String: Any]] = [["Orders": [["Title": "Iphone"], ["Title": "Iphone"], ["Title": "Iphone"]]], ["DefaultAddress": "DefaultAddress"], ["ShippingAddress": "DefaultAddress"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        footerView.frame.size.height = 50
        
        recentOrderTableView.delegate = self
        recentOrderTableView.dataSource = self        
        recentOrderTableView.tableFooterView = footerView
        
        registerNib()
    }
    
    func registerNib(){
        self.recentOrderTableView.register(UINib(nibName: "MyOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "orderCell")
        self.recentOrderTableView.register(UINib(nibName: "MyOrderSectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "recentOrderHeader")
        self.recentOrderTableView.register(UINib(nibName: "SavedAddressCell", bundle: nil), forCellReuseIdentifier: "SavedAddressCell")
    }
    
    @IBAction func btnContinueShopping(_ sender: Any) {
    }
}
extension RecentOrdersViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            let x = (tableData[section])["Orders"] as! [[String:Any]]
            return x.count
        }
        else{
            let count = tableData[section]
            return count.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! MyOrderTableViewCell
            cell.lblProduct.text = "Iphone"
            if indexPath.row == 1 || indexPath.row == 2 {
                cell.progressHeight.constant = 0
                cell.progressView.isHidden = true
            }
             return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SavedAddressCell", for: indexPath) as! SavedAddressCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "recentOrderHeader") as! MyOrderSectionHeader
        if section == 0 {
            headerView.lblSectionTitle.text = "header"
        }
        else {
            headerView.lblSectionTitle.text = "Section Header"
            headerView.sectionBottomHeight.constant = 0
        }
        return headerView
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
}
