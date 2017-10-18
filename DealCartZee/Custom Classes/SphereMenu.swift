//
//  SphereMenu.swift
//  Sphere Menu
//
//  Created by Camilo Morales on 10/21/14.
//  Copyright (c) 2014 Camilo Morales. All rights reserved.
//

import Foundation
import UIKit

protocol SphereMenuDelegate{
    func sphereDidSelected(index:Int)
}

class SphereMenu:UIView, UICollisionBehaviorDelegate{
    

    let kItemInitTag:Int = 1001
    let kAngleOffset:CGFloat = CGFloat(.pi/2.0) / 2.5
    let kSphereLength:CGFloat = 120
    let kSphereDamping:Float = 1.0
    
    var delegate:SphereMenuDelegate?
    var count:Int?
    var start:UIImageView?
    var images:Array<UIImage>?
    var items:Array<UIImageView>?
    var positions:Array<NSValue>?
    //for buttons
    var startBtn:UIButton?
    var itemsBtn:Array<UIButton>?
    // animator and behaviors
    var animator:UIDynamicAnimator?
    var collision:UICollisionBehavior?
    var itemBehavior:UIDynamicItemBehavior?
    var snaps:Array<UISnapBehavior>?
    
    var tapOnStart:UITapGestureRecognizer?
    
    var bumper:UIDynamicItem?
    var expanded:Bool?
    var tapToDismiss = true
    
    var dismissTap:UITapGestureRecognizer?
    
    required init(startPoint:CGPoint, startImage:UIImage, submenuImages:Array<UIImage>, tapToDismiss:Bool){
        
        super.init(frame: CGRect.zero)
        
        self.images = submenuImages;
        self.count = self.images!.count;
        self.start = UIImageView(image: startImage, highlightedImage: nil)
        self.start!.isUserInteractionEnabled = true;
        self.tapOnStart = UITapGestureRecognizer(target: self, action: #selector(startTapped(gesture:)))
        self.start!.addGestureRecognizer(self.tapOnStart!)
        self.addSubview(self.start!);
        self.bounds = CGRect(x:0, y:0, width:startImage.size.width, height: startImage.size.height);
        self.center = startPoint;
        self.expanded = false
        self.tapToDismiss = tapToDismiss
        self.dismissTap = UITapGestureRecognizer(target: self, action: #selector(hide))

    }
    ///BTNSssssssssss
//    var start1:UIButton!
//    var menuButtons:Array<UIButton>
//   required init(startPoint:CGPoint, startButton:UIButton, submenuButtons:Array<UIButton>, tapToDismiss:Bool){
//
//    super.init(frame: CGRect.zero)
//
//    self.ite = submenuButtons;
//    self.count = self.menuButtons.count;
//    self.start1 = startButton;
//    self.start!.isUserInteractionEnabled = true;
//    start1.addTarget(self, action: #selector(startTapped(gesture:)), for: .touchUpInside)
//    //self.tapOnStart = UITapGestureRecognizer(target: self, action: #selector(startTapped(gesture:)))
//    //self.start!.addGestureRecognizer(self.tapOnStart!)
//    //self.addSubview(self.start!);
//    self.bounds = CGRect(x:0, y:0, width:startButton.frame.size.width, height: startButton.frame.size.height);
//    self.center = startPoint;
//    self.expanded = false
//    self.tapToDismiss = tapToDismiss
//    self.dismissTap = UITapGestureRecognizer(target: self, action: #selector(hide))
//
//    }
    required init(coder aDecoder: NSCoder) {
        self.count = 0;
        self.start = UIImageView()
//        self.start1 = UIButton()
        self.images = Array()
//        self.menuButtons = Array()
        super.init(frame: CGRect.zero)
    }
    
    required override init(frame: CGRect) {
        self.count = 0;
        self.start = UIImageView()
        self.images = Array()
        super.init(frame: frame)
    }
    
    override func didMoveToSuperview() {
        self.commonSetup()
    }
    
    @objc func hide(){
        if (self.expanded!) {
            self.shrinkSubmenu()
        }
    }
    
    func commonSetup()
    {
        self.items = Array()
        self.positions = Array()
        self.snaps = Array()
        let count = self.count!
        // setup the items
        for i in 0..<count {
            let item = UIImageView(image: self.images![i])
            item.tag = kItemInitTag + i;
//            item.backgroundColor = UIColor(red: 12/255.0, green: 85/255, blue: 174/255, alpha: 1.0)
            item.isUserInteractionEnabled = true;
            self.superview?.addSubview(item)
    
            let position = self.centerForSphereAtIndex(index: i)
            item.center = self.center;
            self.positions?.append(NSValue.init(cgPoint: position))
            
    
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(gesture:)))
            item.addGestureRecognizer(tap)
    
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panned(gesture:)))
            //item.addGestureRecognizer(pan)
            self.items?.append(item)
        }
    
        self.superview?.bringSubview(toFront: self)
    
        // setup animator and behavior
        self.animator = UIDynamicAnimator(referenceView: self.superview!)
        self.collision = UICollisionBehavior(items: self.items!)
        self.collision?.translatesReferenceBoundsIntoBoundary = true;
        //self.collision?.collisionDelegate = self;
        let count1 = self.count!
        for i in 0..<count1 {
            let snap = UISnapBehavior(item: self.items![i], snapTo: self.center)
            snap.damping = 0.0//CGFloat(kSphereDamping)
            self.snaps?.append(snap)
        }
    
        self.itemBehavior = UIDynamicItemBehavior(items: self.items!)
        self.itemBehavior?.allowsRotation = false;
        self.itemBehavior?.elasticity = 0.25;
        self.itemBehavior?.density = 0.5;
        self.itemBehavior?.angularResistance = 2//4;
        self.itemBehavior?.resistance = 10;
        self.itemBehavior?.elasticity = 0.0 //0.8;
        self.itemBehavior?.friction = 0.5;
    }

    func centerForSphereAtIndex(index:Int) -> CGPoint{
        let firstAngle:CGFloat = CGFloat(Double.pi) + (CGFloat(.pi / 6.0) - kAngleOffset) + CGFloat(index) * kAngleOffset
        print(firstAngle)
        let startPoint = self.center
        let x = startPoint.x + cos(firstAngle) * kSphereLength;
        let y = startPoint.y + sin(firstAngle) * kSphereLength;
        let position = CGPoint(x:x, y:y);
        return position;
    }
    
    @objc func startTapped(gesture:UITapGestureRecognizer){
        self.animator?.removeBehavior(self.collision!)
        self.animator?.removeBehavior(self.itemBehavior!)
        self.removeSnapBehaviors()
        
        if (self.expanded == true) {
            self.shrinkSubmenu()
        } else {
            self.expandSubmenu()
        }
    }

    @objc func tapped(gesture:UITapGestureRecognizer)
    {
        var tag = gesture.view?.tag
        tag? -= Int(kItemInitTag)
        self.delegate?.sphereDidSelected(index: tag!)
        self.shrinkSubmenu()
    }

    @objc func panned(gesture:UIPanGestureRecognizer)
    {
        let touchedView = gesture.view;
        if (gesture.state == UIGestureRecognizerState.began) {
            self.animator?.removeBehavior(self.itemBehavior!)
            self.animator?.removeBehavior(self.collision!)
            self.removeSnapBehaviors()
        } else if (gesture.state == UIGestureRecognizerState.changed) {
            touchedView?.center = gesture.location(in: self.superview)
        } else if (gesture.state == UIGestureRecognizerState.ended) {
            self.bumper = touchedView;
            self.animator?.addBehavior(self.collision!)
            let index = self.indexOfItemInArray(dataArray: self.items!, item: touchedView!)

            if (index >= 0) {
                self.snapToPostionsWithIndex(index: index)
            }
        }
    }
    
    func indexOfItemInArray(dataArray:Array<UIImageView>, item:AnyObject) -> Int{
        var index = -1
        for i in 0..<dataArray.count{
            if (dataArray[i] === item){
                index = i
                break
            }
        }
        return index
    }
    
    func shrinkSubmenu(){
        self.animator?.removeBehavior(self.collision!)
        
        for i in 0..<self.count!  {
            self.snapToStartWithIndex(index: i)
        }
        self.expanded = false;
        self.superview?.removeGestureRecognizer(self.dismissTap!)
    }
    
    func expandSubmenu(){
        for i in 0..<self.count! {
            self.snapToPostionsWithIndex(index: i)
        }
        self.expanded = true;
        self.superview?.addGestureRecognizer(self.dismissTap!)
    }
    
    func snapToStartWithIndex(index:Int)
    {
        let snap = UISnapBehavior(item: self.items![index], snapTo: self.center)
        snap.damping = CGFloat(kSphereDamping)
        let snapToRemove = self.snaps![index];
        self.snaps![index] = snap;
        self.animator?.removeBehavior(snapToRemove)
        self.animator?.addBehavior(snap)
    }
    
    func snapToPostionsWithIndex(index:Int)
    {
        let positionValue:AnyObject = self.positions![index];
        let position = positionValue.cgPointValue
        let snap = UISnapBehavior(item: self.items![index], snapTo: position!)
        snap.damping = CGFloat(kSphereDamping)
        let snapToRemove = self.snaps![index];
        self.snaps![index] = snap;
        self.animator?.removeBehavior(snapToRemove)
        self.animator?.addBehavior(snap)
    }

    func removeSnapBehaviors()
    {
        let count = self.snaps?.count
        for i in 0..<count! {
            self.animator?.removeBehavior((self.snaps?[i])!)
        }
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, endedContactFor item1: UIDynamicItem, with item2: UIDynamicItem) {
      //  return;
        self.animator?.addBehavior(self.itemBehavior!)

        if (item1 !== self.bumper){
            let index = self.indexOfItemInArray(dataArray: self.items!, item: item1)
            if (index >= 0) {
                self.snapToPostionsWithIndex(index: index)
            }
        }
        
        if (item2 !== self.bumper){
            let index = self.indexOfItemInArray(dataArray: self.items!, item: item2)
            if (index >= 0) {
                self.snapToPostionsWithIndex(index: index)
            }
        }
    }

}

