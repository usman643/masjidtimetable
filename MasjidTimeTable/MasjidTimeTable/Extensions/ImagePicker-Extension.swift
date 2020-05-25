//
//  ImagePickerExtension.swift
//  NoBolo
//
//  Created by Muneeb on 4/25/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func addImagePicker(title: String, msg: String, imagePicker: UIImagePickerController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
            print("Camera button clicked")
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Photos", style: .default , handler:{ (UIAlertAction)in
            print("Gallery button clicked")
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
