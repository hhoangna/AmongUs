//
//  BaseVC.swift
//  AmongUs
//
//  Created by HHumorous on 10/11/2020.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}

extension BaseVC: UIGestureRecognizerDelegate {
    
}
