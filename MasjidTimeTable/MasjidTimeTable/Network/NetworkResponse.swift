//
//  NetworkResponse.swift
//  Codeable Practice
//
//  Created by Muneeb on 4/24/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation
import Alamofire

typealias APICompletion<T: Codable> = (_ result: RootObj<T>?) -> Void //returning RootObj as call back as it has status, msg and decoded data

class API : NSObject {
    
    public static let shared = API()
    private override init() {}
    
    private var httpHeaders: HTTPHeaders {
        return ["Authorization":"Basic Y2F5emVuOnNkc29sOTkh",
                "Content-Type":"application/json"]
    }
    
    internal func sendData<T: Codable>(url: String, requestType: RequestType, params: [String: Any], objectType: T.Type, completion: @escaping APICompletion<T>) {
        let myURL = APIPath.baseURL + url
        print(myURL)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let request: HTTPMethod = requestType == RequestType.get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URL(string: myURL)!, method: request, parameters: params, headers: self.httpHeaders).responseData { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            
            switch response.result{
            case .success(_):
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(RootObj<T>.self, from: data)
                    
                    if decodedData.code != 0 {
                        NetworkError.shared.handleErrors(code: (decodedData.code ?? -1), status: (decodedData.status ?? "No Status Message Returned"), error: nil)
                    } else {
                        //sucess scenario
                        completion(decodedData)
                    }
                    
                    completion(decodedData)
                } catch let err {
                    print("Err", err)
                    NetworkError.shared.handleErrors(code: -1, status: "", error: err)
                }
            case .failure(let error):
                print("Err", error)
                NetworkError.shared.handleErrors(code: -1, status: "", error: error)
                break;
                
            }
            
          
        }
        
    }
    
    
    
}



enum RequestType: String {
    case get, post;
}
