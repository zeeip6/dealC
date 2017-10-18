//
//  BannerTableViewCell.swift
//  DealCartZee
//
//  Created by Webwerks on 03/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    //MARK:- Outlet
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var btnSpecialOffer: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
       
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 15)
        self.backgroundColor = UIColor.clear
        layout.minimumLineSpacing = CGFloat(20)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 130) //  - 60
        layout.scrollDirection = .horizontal
        
        bannerCollectionView.collectionViewLayout = layout
        bannerCollectionView.frame.size.width = UIScreen.main.bounds.width
        
        let cell = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        self.bannerCollectionView.register(cell, forCellWithReuseIdentifier: "bannerCell")
        
        btnSpecialOffer.alpha = 0.9
        
    }
}

extension BannerTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerCollectionViewCell
        cell.layer.cornerRadius = 3.0
        
        return cell
    }

    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth: Float = Float(UIScreen.main.bounds.width - 40)  //480 + 50
        // width + space
        let currentOffset: Float = Float(scrollView.contentOffset.x)
        let targetOffset: Float = Float(targetContentOffset.pointee.x)
        var newTargetOffset: Float = 0
        if targetOffset > currentOffset {
            newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth
        }
        else {
            newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth
        }
        if newTargetOffset < 0 {
            newTargetOffset = 0
        }
        else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(Float(scrollView.contentSize.width))
        }
        
        targetContentOffset.pointee.x = CGFloat(currentOffset)
        scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: scrollView.contentOffset.y), animated: true)
        
    }
}
