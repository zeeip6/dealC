//
//  CategoryTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 03/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var categories: [String] = ["Electronics", "Appliances", "Home & Furniture", "Fashion", "All Categories"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        self.frame.size.width = UIScreen.main.bounds.width //, height: 100)
        categoryCollectionView.frame.size.width = self.frame.size.width - 20
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumLineSpacing = CGFloat(5)
        layout.itemSize =  CGSize(width:  categoryCollectionView.frame.size.width / 6, height: categoryCollectionView.frame.size.height)
        
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.layer.cornerRadius = 3.0
        
        self.backgroundColor = UIColor.clear
        let cell = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        self.categoryCollectionView.register(cell, forCellWithReuseIdentifier: "categoryCell")
    }
}

extension CategoryTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.lblCategory.text = categories[indexPath.row]
        
        return cell
    }
    
}
