//
//  CustomViewController.swift
//  Sail Uday
//
//  Created by webwerks1 on 8/2/17.
//  Copyright © 2017 webwerks1. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController, UIScrollViewDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate {
    var doneToolbar: UIToolbar? = nil
  @IBOutlet  var CscrollView:UIScrollView? = nil
   var CtextField: UITextField? = nil
    var tap:UITapGestureRecognizer? = nil
    
    // MARK:- Lifecycle methodes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupToolBarForKeyboard()
        self.CscrollView?.contentInset = UIEdgeInsets.zero
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "Nav_bar"), for: .top, barMetrics: .default)
        self.navigationController?.navigationBar.shadowImage = nil

        tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.view.addGestureRecognizer(tap!)
        tap?.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupKeyboard()
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardObserver()
        self.view.endEditing(true)
    }
        // MARK:- TapGesture Methode
    
    @objc func tapAction()
    {
        CtextField = nil
        self.view.endEditing(true)
    }
    @objc func doneButtonClicked()
    {
        CtextField = nil
        self.view.endEditing(true)
    }
    
    //MARK:- Keyboard handling Methodes
    
    func setupToolBarForKeyboard()
    {
        doneToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        doneToolbar?.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonClicked))
        
        let items = [flexSpace, done]
        doneToolbar?.items = items
        doneToolbar?.sizeToFit()
    }
    func setupKeyboard()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

    @objc func keyboardDidShow(notification: NSNotification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.object(forKey: UIKeyboardFrameEndUserInfoKey)! as AnyObject).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        CscrollView?.contentInset = contentInsets
        CscrollView?.scrollIndicatorInsets = contentInsets
        
        var viewRect = view.frame
        viewRect.size.height -= keyboardSize.height
        
        //print((CtextField?.frame.origin.y)!)
        //print(keyboardSize.height)
       if (CtextField?.frame.origin.y)! > keyboardSize.height || (CtextField?.frame.origin.y)! < 0
       {
        if viewRect.contains((CtextField?.frame.origin)!) {
            let scrollPoint = CGPoint(x: 0,y: (CtextField?.frame.origin.y)! - keyboardSize.height)
            CscrollView?.setContentOffset(scrollPoint, animated: true)
        }
    }
    }
 
    @objc func keyboardWillHide(notification:NSNotification){
        
        self.CscrollView?.contentInset = UIEdgeInsets.zero
        self.resignFirstResponder()
        CtextField = nil
    }
    
     // MARK:- UItextfield delegates methodes
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        CtextField = textField
        if textField.keyboardType == UIKeyboardType.numberPad || textField.inputView is UIDatePicker
        {
            CtextField?.inputAccessoryView = doneToolbar
        }
    }
   

    // MARK:- Scrollview delegates methodes
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
