//
//  AppDelegate.swift
//  Birla
//
//  Created by Mudassir on 4/22/19.
//  Copyright © 2019 Mudassir. All rights reserved.
//

import UIKit
import SVProgressHUD
import IQKeyboardManager

let app = UIApplication.shared.delegate as! AppDelegate
var loginUrl = "https://birlacarbon-test.hypeinnovation.com"
var dashboardUrl = "https://birlacarbon-test.hypeinnovation.com/m3?userAction=GetConfiguration"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //        // Override point for customization after application launch.
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().isEnableAutoToolbar = true
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        IQKeyboardManager.shared().shouldShowToolbarPlaceholder = false
        UNUserNotificationCenter.current().delegate = self
        registerForRemoteNotification()
        UIApplication.shared.applicationIconBadgeNumber = 0
        isCheckLogIn()
//        showSplash()
        setLanguage()
        setSVProgressHUD()
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: UIControl.State.highlighted)
        return true
    }
    
    func showSplash(){
        let vc = UIStoryboard.storyBoard(withName: .Auth).loadViewController(withIdentifier: SplashVC.className)
        //let navigationVC = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = vc
    }
    
    func registerForRemoteNotification(){
        if #available(iOS 10.0, *) {
                   let center  = UNUserNotificationCenter.current()
                   center.delegate = self
                   center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
                       if error == nil{
                           DispatchQueue.main.async(execute: {
                           UIApplication.shared.registerForRemoteNotifications()
                           })
                       }
                   }
               }
               else { UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
                   UIApplication.shared.registerForRemoteNotifications()
               }
    }
    
    // MARK:- LANGUAGE SETUP
    func setLanguage(){
        if let appLang = UserDefaults.standard.string(forKey: Constants.appLanguageKey) {
            kAppLanguage = appLang
        } else {
            kAppLanguage = "en"
        }
    }
    
    //MARK: - CHECK LOGIN
    func isCheckLogIn() {
        let BirlaCookie = UserDefaults.standard.dictionary(forKey: Constants.BirlaCookie) ?? nil
        
        if BirlaCookie == nil {
            UserDefaults.standard.set([String : AnyObject](),forKey: Constants.BirlaCookie)
            
        }
        UIBarButtonItem.appearance().tintColor = UIColor(hexString: "#D71D24")
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        if Utilities.isLoggedIn(){
            if Utilities.sharedUser?.termsAccepted ?? false{
                
            }else{
                
            }
        }else{
            let vc = UIStoryboard.storyBoard(withName: .Auth).loadViewController(withIdentifier: MainScreenVC.className)
//            let navigationVC = UINavigationController(rootViewController: vc)
            self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        }
        
        
        
    }
    
    func application(_ application: UIApplication,
                didRegisterForRemoteNotificationsWithDeviceToken
                    deviceToken: Data) {
//       self.sendDeviceTokenToServer(data: deviceToken)
        let token = deviceToken.map { String(format: "%02x", $0) }.joined()
        UserDefaults.standard.set(token, forKey: Constants.DeviceToken)
    }
    func application(_ application: UIApplication,
                didFailToRegisterForRemoteNotificationsWithError
                    error: Error) {
        print(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
//        let message = userInfo["Message"] as? [AnyHashable : Any]
//
//        guard let messageTypeID = message?["MessageTypeID"] as? Int, let _ = message?["UserID"] as? Int else {
//            return
//        }
//        let vc = UIStoryboard.storyBoard(withName: .Main).loadViewController(withIdentifier: IdeaDetailVC.className) as! IdeaDetailVC
//        vc.ideaId = messageTypeID
//        guard let rootNav = (self.window?.rootViewController as? UINavigationController) else {return}
//        rootNav.pushViewController(vc, animated: true)
        //self.window?.rootViewController?.present(vc, animated: true, completion: nil)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])

    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

extension AppDelegate {
    func setSVProgressHUD() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setDefaultAnimationType(.native)
    }
}
