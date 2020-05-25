//
//  BaseVC.swift
//  NoBolo
//
//  Created by Muneeb on 4/25/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//



import UIKit
import SDWebImage
class BaseVC: UIViewController {

   
    
    // MARK:- LEFT MENU
//    func setLeftMenuButton(){
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(self.toggle))
//    }
    
//    @objc func toggle(){
//        self.toggleLeft()
//    }
    
    //    MARK: - SDWebImage Methods
    
    //    func setImageWithUrl(imageUrl: String, imageView: UIImageView, placeholderImage: UIImage? = nil) {
    //        imageView.sd_setShowActivityIndicatorView(true)
    //        if let url = URL(string: imageUrl) {
    //            imageView.sd_setIndicatorStyle(UIActivityIndicatorView.Style.gray)
    //            imageView.sd_setImage(with: url, placeholderImage: placeholderImage, options: SDWebImageOptions.highPriority) { (image, error, sdImageCacheType, url) in
    //
    //            }
    //        }
    //    }
    
    func isValidEmail(testStr:String) -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        print(testStr)
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func showAlertWithTitle(title: String, withMessage: String, withNavigation: UIViewController) {
        
        let alertController : UIAlertController = UIAlertController(title: title, message: withMessage, preferredStyle: UIAlertController.Style.alert)
        let cancelAction : UIAlertAction = UIAlertAction(title: "OK".localized, style: .cancel){
            ACTION -> Void in
        }
        alertController.addAction(cancelAction)
        withNavigation.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertWithCancel(_ title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "OK".localized, style: .default, handler: handler)
        let cancelAction = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)
        //        alertController.view.tintColor = UIConfig.appColor
        present(alertController, animated: true, completion: nil)
    }
    
    func setNavBarTitle(title: String) {
        
        let navLabel = UILabel()
        navLabel.text  = title
        navLabel.font = UIFont(name: "Oxygen-Bold", size: 16)
        navLabel.textColor = UIColor.black
        self.navigationItem.titleView = navLabel
        removeBackButtonText()
    }
    
    
    func leftMenuItemSelected(){
//        let vc = UIStoryboard.storyBoard(withName: .Auth).loadViewController(withIdentifier: "\(SignInVC.classForCoder())")
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
