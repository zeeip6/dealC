//
//  HomeProductsTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 04/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class HomeProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var btnViewAll: UIButton!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var h: CGFloat! = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        self.backgroundColor = UIColor.clear
//        productsCollectionView.collectionViewLayout = layout
        collectionViewHeight()
        let cell = UINib(nibName: "ProductCell", bundle: nil)
        productsCollectionView.register(cell, forCellWithReuseIdentifier: "ProductCell")
        
    }
    
    
    
    func collectionViewHeight(){
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        let width = winWidth == 320 ? ((window?.bounds.width)! - 40.0)/2.0 : ((window?.bounds.width)! - 55.0)/2.0
        height.constant = (width + 56) * 2
       
    }   
    
}

extension HomeProductsTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{

        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        let width = winWidth == 320 ? ((window?.bounds.width)! - 40.0)/2.0 : ((window?.bounds.width)! - 55.0)/2.0
        height.constant = (width + 56) * 2
        return CGSize(width: width, height: width + 46)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        if winWidth == 320{
            return UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
        }
        return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        if winWidth == 320{
            return 10.0
        }
        return 15.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        if winWidth == 320{
            return 10.0
        }
        return 15.0
    }
}
