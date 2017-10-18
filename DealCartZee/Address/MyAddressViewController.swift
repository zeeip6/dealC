//
//  MyAddressViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 04/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class MyAddressViewController: ContextMenuViewController {

    @IBOutlet weak var addressListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addressListTableView.delegate = self
        addressListTableView.dataSource = self
        self.addressListTableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        self.addressListTableView.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "addressCell")
    }
    @objc func actionEdit(sender: UIButton){
        
    }
}

extension MyAddressViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as! AddressTableViewCell
        cell.lblAddress.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(actionEdit(sender:)), for: .touchUpInside)
        return cell
    }    
}
