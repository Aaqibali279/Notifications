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

