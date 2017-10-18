//
//  VendorViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 13/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class VendorViewController: UIViewController {

    @IBOutlet weak var vendorDetailTableView: UITableView!
    
    var arr: [String] = ["About", "Shipping Policy", "Refund Policy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendorDetailTableView.delegate = self
        vendorDetailTableView.dataSource = self
        vendorDetailTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        registerNib()
    }
    
    func registerNib(){
        vendorDetailTableView.register(UINib(nibName: "VendorDetailCell", bundle: nil), forCellReuseIdentifier: "VendorDetailCell")
        vendorDetailTableView.register(UINib(nibName: "VendorTableViewCell", bundle: nil), forCellReuseIdentifier: "VendorTableViewCell")
        vendorDetailTableView.register(UINib(nibName: "ProductListTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductListTableViewCell")
    }
}

extension VendorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VendorDetailCell", for: indexPath) as! VendorDetailCell
            cell.lblDescription.text = "long description about the vendor"
            return cell
        }
        else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as! ProductListTableViewCell
            //cell.height.constant = cell.h
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "VendorTableViewCell", for: indexPath) as! VendorTableViewCell
            cell.lblText.text = arr[indexPath.row - 1]
            return cell
        }
    }
}
