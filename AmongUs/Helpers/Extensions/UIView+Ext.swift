//
//  UIView+Ext.swift
//  AnniCount-
//
//  Created by Rum on 10/12/20.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
      get {
        return layer.shadowRadius
      }
      set {
        layer.shadowRadius = newValue
      }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    func fillSuperview() {
        guard let superview = self.superview else {
            return
        }
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraints: [NSLayoutConstraint] = [
            leftAnchor.constraint(equalTo: superview.leftAnchor),
            rightAnchor.constraint(equalTo: superview.rightAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    class func fromNib(named: String? = nil) -> Self {
            let name = named ?? "\(Self.self)"
            guard
                let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
                else { fatalError("missing expected nib named: \(name)") }
            guard
                let view = nib.first as? Self
                else { fatalError("view of type \(Self.self) not found in \(nib)") }
            return view
        }
    
    public var safeAreaFrame: CGRect {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.layoutFrame
        }
        return bounds
    }
    
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
    
    func addShadowDecorate(radius: CGFloat = 8,
                        shadowColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3),
                        shadowOffset: CGSize = CGSize(width: 0, height: 1.0),
                        shadowRadius: CGFloat = 3,
                        shadowOpacity: Float = 1) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
    }
}

class CustomView: UIView {
    @IBInspectable var firstColor: UIColor = UIColor.clear {
       didSet {
           updateView()
        }
     }
     @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
       get {
          return CAGradientLayer.self
       }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
       didSet {
          updateView()
       }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        if (self.isHorizontal) {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
    }
    
    @IBInspectable var maskCorner: Bool {
        get {
            return layer.maskedCorners == [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
        set {
            if newValue {
                layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            }
        }
    }
}

extension UIView {
    func addShadow(with color: UIColor) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    func removeShadow() {
        layer.shadowOpacity = 0
    }
}
