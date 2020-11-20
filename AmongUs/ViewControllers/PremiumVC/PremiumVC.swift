//
//  PremiumVC.swift
//  AmongUs
//
//  Created by HHumorous on 19/11/2020.
//

import UIKit

class PremiumVC: UIViewController {
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnPurchase: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPressTerm(_ sender: UIButton) {
        
    }
    
    @IBAction func onPressPolicy(_ sender: UIButton) {
        
    }
    
    @IBAction func onPressRestore(_ sender: UIButton) {
        
    }
    
    @IBAction func onPressPurchase(_ sender: UIButton) {
        
    }
    
    @IBAction func onPressNotnow(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
