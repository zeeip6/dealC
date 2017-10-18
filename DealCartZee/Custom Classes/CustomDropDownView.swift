//
//  TestView.swift
//  DropdownDemo
//
//  Created by Webwerks on 11/08/17.
//  Copyright © 2017 Hyper Interaktiv AS. All rights reserved.
//

import UIKit
protocol CustomDropDownViewDelegate {
    func selectedInfo(index:Int)
}
class CustomDropDownView: UIView, UIGestureRecognizerDelegate {
    
    public var image : UIImageView! = {
        let image = UIImageView()
        image.isUserInteractionEnabled = true
        image.backgroundColor = UIColor.clear
        return image
    }()
    var delegate : CustomDropDownViewDelegate!

    var items: [[String:Any]] = [[:]]
    var selectedBtn : UIButton?
    public var tableVw: UITableView! = {
        let tableVw = UITableView()
        tableVw.layer.cornerRadius = 5.0
        tableVw.layer.borderWidth = 0.5
        tableVw.layer.borderColor = UIColor.gray.cgColor
        tableVw.tag = 2
        tableVw.showsVerticalScrollIndicator = false
        tableVw.bounces = false
        return tableVw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(image)
        image.frame = frame
        self.addSubview(tableVw)
        tableVw.delegate = self
        tableVw.dataSource = self
        self.isHidden = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        gestureRecognizer.delegate = self
        self.image.addGestureRecognizer(gestureRecognizer)
        
        tableVw.register(DropCell.self, forCellReuseIdentifier: "cell")
    }
    
    func button(sender: UIButton, items: [[String:Any]]){
        self.items = items
        selectedBtn = sender;
        let buttonFrame = self.superview?.convert(sender.frame, from:sender.superview)
        
        tableVw.frame.origin = CGPoint(x: (buttonFrame?.origin.x)!+10, y: (buttonFrame?.origin.y)! + sender.frame.size.height)
        tableVw.frame.size.width = self.frame.size.width / 2
        if self.isHidden {
            self.isHidden = false
            UIView.animate(withDuration: 0.5){
                self.tableVw.frame.size.height = (self.tableVw.rectForRow(at: [0,0]).size.height) * CGFloat(items.count) > (self.frame.size.height / 3)  ? (self.frame.size.height / 3) : (self.tableVw.rectForRow(at: [0,0]).size.height) * CGFloat(items.count)//(self.tableVw.rectForRow(at: [0,0]).size.height) * self.frame.size.height / 2
            }
        }
        else{
            
            UIView.animate(withDuration: 0.5, animations: {self.tableVw.frame.size.height = 0}, completion: {_ in self.isHidden = true})
        }
    }
    
    @objc func handleTap(){
        
        if self.isHidden {
            self.isHidden = false
            UIView.animate(withDuration: 0.5){
                self.tableVw.frame.size.height = self.tableVw.rectForRow(at: [0,0]).size.height
            }
        }
        else{
            UIView.animate(withDuration: 0.5, animations: {self.tableVw.frame.size.height = 0}, completion: {_ in self.isHidden = true})
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomDropDownView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableVw.dequeueReusableCell(withIdentifier: "cell")!
        let dict = items[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = UIColor.darkGray //UIColor(colorLiteralRed: 0.329, green: 0.329, blue: 0.329, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBtn?.setTitle(items[indexPath.row]["name"] as? String, for: .normal)
        delegate.selectedInfo(index: indexPath.row)
        self.handleTap()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class DropCell: UITableViewCell{
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
