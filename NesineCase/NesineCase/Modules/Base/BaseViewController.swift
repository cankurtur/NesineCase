//
//  BaseViewController.swift
//  NesineCase
//
//  Created by Can Kurtur on 11.05.2023.
//

import UIKit

class BaseViewController: UIViewController {

    var screenName: String {
        return "#" + self.className
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("initialized: ", screenName)
    }
    
    deinit {
        print("deinitialized:", screenName)
    }
}
