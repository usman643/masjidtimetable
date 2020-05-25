//
//  UIView-Extension.swift
//  NoBolo
//
//  Created by Muneeb on 4/25/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
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
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
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
    
    func rotate(angleInDegrees: DegreeAngle) {
        UIView.animate(withDuration: 0.5) {
            self.transform = CGAffineTransform(rotationAngle: .pi * angleInDegrees.rawValue)
        }
    }
    
}


enum DegreeAngle: CGFloat {
    case angle90 = 0.5
    case angle180 = 1.0
    case angle270 = 1.5
    case angle360 = 2.0
}

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}

extension UIViewController {
    
    func removeBackButtonText() {
        if let nav = self.navigationController,
            let item = nav.navigationBar.topItem {
            item.backBarButtonItem  = UIBarButtonItem(title: " ", style: .plain, target: self, action:nil)
        } else {
            if let nav = self.navigationController,
                let _ = nav.navigationBar.backItem {
                self.navigationController!.navigationBar.backItem!.title = " "
            }
        }
    }
    
}

