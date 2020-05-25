//
//  NetworkResponse.swift
//  NoBolo
//
//  Created by Muneeb on 4/24/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import AEXML

enum RequestType: String {
    case get, post;
}

//returning APIResponse as call back as it has status, msg and decoded data
typealias APICompletion = (_ result: APIResponse?, _ object: Decodable?) -> Void
typealias APIXmlCompletion = (_ result: String?) -> Void

let baseURL = "https://birlacarbon-test.hypeinnovation.com/servlet/api/"

class API {
    
    public static let shared = API()
    private init() {}
    
    //MARK: - Headers
    private var httpHeaders: HTTPHeaders {
        return ["Authorization":"Basic c2Rzb2w6c2Rzb2w5OQ==",
                "Content-Type":"application/json"]
    }
    
    //MARK: - Network Functions
    
    internal func callAPI<T: Decodable>(url: String, requestType: HTTPMethod, params: [String: Any]?, objectType: T.Type, decodeWithKey: String, showLoader: Bool = true, completion: @escaping APICompletion){
        
        let myURL = APIPath.baseUrl.rawValue + url
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if showLoader {SVProgressHUD.show()}
        
        AF.request(URL(string: myURL)!, method: requestType, parameters: params, encoding: JSONEncoding.default, headers: httpHeaders).responseData { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if showLoader {SVProgressHUD.dismiss()}
            switch response.result{
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(APIResponse.self, from: data)
                    if decodedData.response?.code == 0{
                        let jsonData = try JSONSerialization.data(withJSONObject: decodedData.response?.json as Any, options: .prettyPrinted)
                        if decodeWithKey != ""{
                            let finalObject = try decoder.decode(objectType.self, from: jsonData, keyedBy: decodeWithKey)
                            completion(decodedData, finalObject)
                        }else{
                            completion(decodedData, nil)
                        }
                    }else{
                        self.showAlert(error: decodedData.response?.status)
                        completion(decodedData, nil)
                    }
                } catch let err {
                    print("Err", err)
                    APIError.shared.handleNetworkErrors(error: err)
                }
            case .failure(let error):
                print("Err", error)
                APIError.shared.handleNetworkErrors(error: error)
                break;
            }
        }
    }
    

    func showAlert(error: String?){
        let alertController = UIAlertController(title: "Error", message: error ?? "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

