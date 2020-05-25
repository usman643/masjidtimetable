    
//
//  Utilities.swift
//  CollegEcorps
//
//  Created by musharraf on 03/08/2016.
//  Copyright © 2016 musharraf. All rights reserved.
//

import UIKit
import SystemConfiguration
import AVFoundation
import Photos


class Utilities: NSObject {
    
      static let sharedInstance = Utilities()
      static var sharedUser : UserInfo?
    static let languages:[LanguageType] = [.English,.Potugese,.Spanish,.Hungarian,.Italian,.Arabic,.Hindi,.Thai,.Mandarin,.Korean]
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    class func isLoggedIn() -> Bool{
        var isLogin : Bool = false
        if let savedUser = UserDefaults.standard.object(forKey: Constants.SavedUser) as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(UserInfo.self, from: savedUser) {
                self.sharedUser = loadedUser
                isLogin = true
            }
        }else{ isLogin =  false}
        return isLogin
        
    }
    
    class func saveUserObj(user:UserInfo){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: Constants.SavedUser)
            sharedUser = user
        }
    }
    
    
    
    
    class func logout(){
        UserDefaults.standard.removeObject(forKey: Constants.SavedUser)
        UserDefaults.standard.removeObject(forKey: Constants.BirlaCookie)
        UserDefaults.standard.removeObject(forKey: Constants.SessionID)
        self.sharedUser = nil
        app.isCheckLogIn()
    }
   
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
    
   
    class func doCustomAlertBorder(_ alert: UIAlertController){
        
        let FirstSubview = alert.view.subviews.first
        let AlertContentView = FirstSubview?.subviews.first
        for subview in (AlertContentView?.subviews)! {
            subview.contentMode = .left
            
//            subview.backgroundColor = UIColor(hexString: "#3A3C4B")
            subview.backgroundColor = UIColor.white
            subview.layer.cornerRadius = 10
            //            subview.tintColor = UIColor(hexString: "#2CCA58")
            alert.view.tintColor = UIColor.white
            subview.alpha = 1
            subview.layer.borderWidth = 5
            subview.layer.borderColor = UIColor.black.cgColor
        }
    }

    
   class func getAssetThumbnail(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        var thumbnail = UIImage()
        option.isSynchronous = true
        print(asset.pixelWidth)
        print(asset.pixelHeight)
        manager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight), contentMode: .aspectFit, options: option, resultHandler: {(result, info)->Void in
            thumbnail = result!
        })
        return thumbnail
    }

    
    func toolbar(doneFunc: Selector) -> UIToolbar{
        let toolb = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 46))
        toolb.sizeToFit()
        let barButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: nil, action:doneFunc)
        toolb.setItems([barButton,doneButton], animated: true)
        return toolb
    }
}
    
    public enum LanguageType: String{
        case English = "en"
        case Potugese = "pt-PT"
        case Spanish = "es"
        case Hungarian = "hu"
        case Italian = "it"
        case Arabic = "ar"
        case Hindi = "hi"
        case Thai = "th"
        case Korean = "ko"
        case Mandarin = "zh-Hans-CN"
    }
