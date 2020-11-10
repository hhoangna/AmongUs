//
//  IBDesignable+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension UIButton {
    @IBInspectable var localizedKey: String {
        get {
            return ""
        } set {
            self.setTitle(newValue.localized, for: .normal)
        }
    }
}

extension UILabel {
    private func fadeTransition(_ duration:CFTimeInterval) {
      let animation = CATransition()
      animation.timingFunction = CAMediaTimingFunction(name:
          CAMediaTimingFunctionName.easeInEaseOut)
      animation.type = CATransitionType.fade
      animation.duration = duration
      layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }

    func textWithAnimation(text:String,duration:CFTimeInterval){
      fadeTransition(duration)
      self.text = text
    }

    @IBInspectable var localizedKey: String {
        get {
            return ""
        } set {
            self.text = newValue.localized
        }
    }
}

class CustomTextField: UITextField {

    let padding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
