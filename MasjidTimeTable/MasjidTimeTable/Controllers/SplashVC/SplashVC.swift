//
//  SplashVC.swift
//  BirlaCarbon
//
//  Created by Mudassir Abbas on 06/05/2020.
//  Copyright © 2020 Muneeb. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        getData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func getData(){
        API.shared.callAPI(url: APIPath.getSetting.rawValue, requestType: .get, params: nil, objectType: SSOModel.self, decodeWithKey: "SSO", showLoader: false) { (response, model) in
            guard let model = model as? SSOModel else{return}
            loginUrl = model.sSOLogin ?? ""
            dashboardUrl = model.sSOGetConfiguration ?? ""
            app.isCheckLogIn()
        }
    }
}
