//
//  HomeViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 03/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: ContextMenuViewController{
    
    //MARK:- Outlet
    @IBOutlet weak var homeTableView: UITableView!
    
    //MARK:- Lifecylce Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        self.title = "Welcome, Smith"
        let user = "admin"
        let password = "admin123"
        var headers: HTTPHeaders = ["Authorization":"Basic YWRtaW46YWRtaW4xMjM="]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
//        Alamofire.request("http://10.0.100.130/dealcart/customapi/homepage/menuitems", headers: headers)
//            .responseJSON { response in
//
//                print(response)
//                debugPrint(response)
//        }
        
        Alamofire.request("http://10.0.100.130/dealcart/customapi/customer/forgotpassword", method: .post, parameters: ["email":"zeeshan@gmail.com"], encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            print(response)
        }
        registerNib()
    }
    
    func callWebservice(){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        VC = self
    }
    
    //MARK:- Class Methods
    func registerNib(){
        let cell1 = UINib(nibName: "BannerTableViewCell", bundle: nil)
        self.homeTableView.register(cell1, forCellReuseIdentifier: "headCell")
        let cell2 = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        self.homeTableView.register(cell2, forCellReuseIdentifier: "categoryCell")
        let cell3 = UINib(nibName: "HomeProductsTableViewCell", bundle: nil)
        self.homeTableView.register(cell3, forCellReuseIdentifier: "homeProductCell")
    }
    
    //MARK:- Actions
    
    @IBAction func cartClicked(_ sender: Any) {
        let cartController = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController")
        self.navigationController?.pushViewController(cartController!, animated: true)
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "headCell") as! BannerTableViewCell
            return cell
        }
        else if indexPath.row == 1 {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CategoryTableViewCell
            return cell
        }
        else {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "homeProductCell") as! HomeProductsTableViewCell
            
            return cell
        }
    }
}
