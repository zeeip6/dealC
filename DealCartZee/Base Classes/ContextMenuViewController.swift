//
//  ContextMenuViewController.swift
//  DealCartZee
//
//  Created by Webwerks on 10/10/17.
//  Copyright © 2017 Webwerks. All rights reserved.
//

import UIKit

class ContextMenuViewController: UIViewController, SphereMenuDelegate {

    var VC: UIViewController?  = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        let start = UIImage(named: "menu_homescreen")
        let image1 = UIImage(named: "automotiveshape")
        let image2 = UIImage(named: "automotiveshape")
        let image3 = UIImage(named: "automotiveshape")
        let image4 = UIImage(named: "automotiveshape")
        let images:[UIImage] = [image1!,image2!,image3!, image4!]
        
        let menu = SphereMenu(startPoint: CGPoint(x:self.view.frame.size.width - 60, y:self.view.frame.size.height - 60), startImage: start!, submenuImages:images, tapToDismiss:true)
        
        menu.delegate = self
        self.view.addSubview(menu)
    }
    
    func sphereDidSelected(index: Int) {
        switch index {
        case 0:
            if !(VC! is HomeViewController) {
                let homeController = VC?.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                VC?.navigationController?.pushViewController(homeController!, animated: true)
            }
            break
        case 1:
            let wishlistController = VC?.storyboard?.instantiateViewController(withIdentifier: "WishlistViewController")
            VC?.navigationController?.pushViewController(wishlistController!, animated: true)
            break
        case 2:
            let notificationController = VC?.storyboard?.instantiateViewController(withIdentifier: "WishlistViewController")
        VC?.navigationController?.pushViewController(notificationController!, animated: true)
            break
        case 3:
            let wishlistController = VC?.storyboard?.instantiateViewController(withIdentifier: "WishlistViewController")
            VC?.navigationController?.pushViewController(wishlistController!, animated: true)
            break
        default : break
        }
    }
}
