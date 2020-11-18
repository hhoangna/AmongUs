//
//  ResultView.swift
//  AmongUs
//
//  Created by HHumorous on 18/11/2020.
//

import UIKit

class ResultView: UIView {
    
    typealias ResultCallback = (Bool) -> Void

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var callback: ResultCallback?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    @IBAction func onPressCreate(_ sender: UIButton) {
        hide()
        callback?(true)
    }

    @IBAction func onPressBack(_ sender: UIButton) {
        hide()
        callback?(false)
    }
    
    func show() {
        /* Add dialog to main window */
        guard let window = UIApplication.shared.keyWindowInConnectedScenes else { fatalError() }
        window.addSubview(self)
        self.fillSuperview()
        window.bringSubviewToFront(self)
        window.endEditing(true)
        
        self.layer.opacity = 0
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        /* Anim */
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.layer.opacity = 1
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func hide() {
        guard let window = UIApplication.shared.keyWindowInConnectedScenes else { fatalError() }
        window.becomeFirstResponder()
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.layer.opacity = 0
        }) { (_) in
            for v in self.subviews {
                v.removeFromSuperview()
            }
            
            self.removeFromSuperview()
        }
    }
}
