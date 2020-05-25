//
//  UITextFieldExtension.swift
//  NoBolo
//
//  Created by Muneeb on 4/25/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
//    @IBInspectable var paddingLeft: CGFloat {
//        get{
//            return 0
//        }
//        set (f) {
//            layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
//        }
//    }
    @IBInspectable var leadingImage: UIImage? {
        get{
            return self.leadingImage
        }
        set{
            let padding = 8
            let size = 15

            let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
            let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
            iconView.contentMode = .scaleAspectFit
            iconView.image = newValue
            outerView.addSubview(iconView)
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = outerView
        }
    }
    @IBInspectable var placeHolderColor: UIColor? {
        
        get {
            return self.placeHolderColor
        }
        set {
            self.font = UIFont(name: "Nunito-Regular", size: 14)
            let attributes = [NSAttributedString.Key.foregroundColor: newValue!,NSAttributedString.Key.font: UIFont(name: "Nunito-Regular", size: 12)]
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes:attributes as [NSAttributedString.Key : Any])
        }
    }
    open override func awakeFromNib() {
        super.awakeFromNib()
        if UserDefaults.standard.string(forKey: Constants.appLanguageKey) ==  "ar" {
//            if textAlignment == .natural {
//                self.textAlignment = .right
//            }
//            else{
//                 self.textAlignment = .left
//            }
        }
    }
}
