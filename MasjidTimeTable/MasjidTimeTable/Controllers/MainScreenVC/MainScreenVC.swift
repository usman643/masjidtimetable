//
//  MainScreenVC.swift
//  BirlaCarbon
//
//  Created by Mudassir Abbas on 17/04/2020.
//  Copyright © 2020 Muneeb. All rights reserved.
//

import UIKit

class MainScreenVC: UIViewController {
    //MARK: - IBOUTLETS
    @IBOutlet weak var employeeAccessBtn:UIButton!
    @IBOutlet weak var submitIdeaBtn:UIButton!
    @IBOutlet weak var dontHaveAccountLbl:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLocalization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        getData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func setLocalization(){
        employeeAccessBtn.setTitle("Employee Access".localized, for: .normal)
        dontHaveAccountLbl.text = "Don't have access?".localized
        submitIdeaBtn.setTitle("Submit an Idea Here".localized, for: .normal)
    }
    
    func getData(){
        API.shared.callAPI(url: APIPath.getSetting.rawValue, requestType: .get, params: nil, objectType: SSOModel.self, decodeWithKey: "SSO", showLoader: false) { (response, model) in
            guard let model = model as? SSOModel else{return}
            loginUrl = model.sSOLogin ?? ""
            dashboardUrl = model.sSOGetConfiguration ?? ""
        }
    }
    
}
