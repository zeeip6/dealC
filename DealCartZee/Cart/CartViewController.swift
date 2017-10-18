//
//  CartViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 29/09/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class CartViewController: ContextMenuViewController {

    //MARK:- Outlets
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet var footerView: UIView!
    @IBOutlet weak var btnCheckOut: UIButton!
    @IBOutlet weak var lblTotal: UILabel!
    //MARK:- Variables
    var counter:[Int] = [1,1,1,1,1,1,1,1]
    var titles: [String] = ["jhsakgskjgjksdhfgjklslfgsdjlkfg", "iphone", "hdsaghdfbgshkfhksasjdfbgsgfbsdgfhmsdkgfh", "sdjfgbsfhgdsh", "jhsakgskjgjksdhfgjklslfgsdjlkfg", "iphone", "hdsaghdfbgshkfhksasjdfbgsgfbsdgfhmsdkgfh", "sdjfgbsfhgdsh"]
    //MARK:- Lifecycle MEthods
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.backgroundColor = UIColor.clear
        cartTableView.tableFooterView = footerView
        footerView.backgroundColor = UIColor.clear
        btnCheckOut.layer.cornerRadius = btnCheckOut.frame.size.height / 2.0
        let cell = UINib(nibName: "CartTableViewCell", bundle: nil)
        self.cartTableView.register(cell, forCellReuseIdentifier: "cartCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        VC = self
    }
    
    //MARK:- Actions
    @IBAction func actionCheckOut(_ sender: Any) {
    }
    
    //MARK:- Cell buttons Actions
    @objc func actionAdd(sender: UIButton){
        counter[sender.tag] += 1
        DispatchQueue.main.async {
        UIView.setAnimationsEnabled(false)
            
        let contentOffset = self.cartTableView.contentOffset
            
        self.cartTableView.beginUpdates()
        self.cartTableView.reloadRows(at: [[0,sender.tag]], with: .fade)
        self.cartTableView.endUpdates()

        self.cartTableView.contentOffset = contentOffset
        UIView.setAnimationsEnabled(true)
        }
    }
    @objc func actionSubtract(sender: UIButton){
        if counter[sender.tag] > 1 {
        counter[sender.tag] -= 1
        
            DispatchQueue.main.async {
                UIView.setAnimationsEnabled(false)
                
                let contentOffset = self.cartTableView.contentOffset
                
                self.cartTableView.beginUpdates()
                self.cartTableView.reloadRows(at: [[0,sender.tag]], with: .fade)
                self.cartTableView.endUpdates()
                
                self.cartTableView.contentOffset = contentOffset
                UIView.setAnimationsEnabled(true)
            }
        }
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! CartTableViewCell
        cell.lblTitle.text = titles[indexPath.row]
        
        cell.btnPlus.tag = indexPath.row
        cell.btnMinus.tag = indexPath.row
        
        cell.btnPlus.addTarget(self, action: #selector(actionAdd(sender:)), for: .touchUpInside)
        cell.btnMinus.addTarget(self, action: #selector(actionSubtract(sender:)), for: .touchUpInside)
    
        cell.txtQuantity.text = String(describing: counter[indexPath.row])
        
        return cell
    }
    
}
