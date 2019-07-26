//
//  ViewController.swift
//  Notifications
//
//  Created by Aquib on 24/07/19.
//  Copyright © 2019 Aquib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObserver(selector: #selector(setText(notification:)), name: .click)
        
    }
    
    @objc func setText(notification:Notification) {
        label.text = notification.object as? String
    }
}

class AnotherVC: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        addObserver(selector: #selector(setText(notification:)), name: .click)
    
    }
    
    @objc func setText(notification:Notification) {
        label.text = notification.object as? String
    }
    
}

class SecondVC:UIViewController{
    
    @IBAction func action(_ sender: UIButton) {
        postNotificaton(name: .click,object: "local notification")
    }

}


enum NotificationName:String{
    case click,name
}

extension NSObject {
    func addObserver(selector:Selector,name:NotificationName){
        NotificationCenter.default.removeObserver(self, name: .init(name.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: selector, name: .init(name.rawValue), object: nil)
    }
    
    func postNotificaton(name:NotificationName,object:Any? = nil){
        NotificationCenter.default.post(name: .init(name.rawValue), object: object)
    }

}


class Animator {
    static let instance = Animator()
    private init(){}
    
    func bounceIn(cell:UITableViewCell,row:Int){
        cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height)
        
        UIView.animate(
            withDuration: 1,
            delay: 0.05 * Double(row),
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.1,
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    func fadeIn(cell:UITableViewCell,row:Int){
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func moveFade(cell:UITableViewCell,row:Int){
        cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height/2)
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
        })
    }
    
    func slideIn(cell:UITableViewCell,row:Int,tableView:UITableView){
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(row),
            options: [.curveEaseInOut],
            animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
}


