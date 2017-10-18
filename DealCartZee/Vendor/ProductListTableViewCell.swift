//
//  ProductListTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 16/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productListCollection: UICollectionView!
    @IBOutlet weak var height: NSLayoutConstraint!
    
    var h: CGFloat! = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productListCollection.delegate = self
        productListCollection.dataSource = self
        //height.constant = h
        let cell = UINib(nibName: "ProductCell", bundle: nil)
        productListCollection.register(cell, forCellWithReuseIdentifier: "ProductCell")
        collectionViewHeight()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionViewHeight(){
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        let width = winWidth == 320 ? ((window?.bounds.width)! - 40.0)/2.0 : ((window?.bounds.width)! - 55.0)/2.0
        
        height.constant = (width + 56) * 3
    }
    
}

extension ProductListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        height.constant = h
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
         height.constant = h
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        let width = winWidth == 320 ? ((window?.bounds.width)! - 40.0)/2.0 : ((window?.bounds.width)! - 55.0)/2.0
        
        height.constant = (width + 56) * 3
        self.layoutIfNeeded()
        return CGSize(width: width, height: width + 46)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let window = (UIApplication.shared.delegate as! AppDelegate).window
        let winWidth = window?.bounds.width
        if winWidth == 320{
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 5)
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
