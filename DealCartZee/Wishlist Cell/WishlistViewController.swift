//
//  WishlistViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 29/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class WishlistViewController: ContextMenuViewController {

    //MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var footerView: UIView!
    //MARK:- Variables
    var titles: [String] = ["Oven", "iphone", "Headphones", "Covers", "Etc", "iphone", "Laptops", "EarPods"]
    var headerView = UIView()
    
    //MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.frame.size.height = 50.0
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clear
        tableView.tableHeaderView = headerView
        tableView.register(UINib(nibName: "WishlistTableViewCell", bundle: nil), forCellReuseIdentifier: "wishlistCell")
        
        footerView.backgroundColor = UIColor.clear
        footerView.frame.size = CGSize(width: self.view.frame.size.width, height: 50)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        VC = self
    }
}

extension WishlistViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishlistCell") as! WishlistTableViewCell
        cell.lblTitle.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.tableFooterView = footerView
    }
}
