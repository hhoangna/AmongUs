//
//  BaseAPI.swift
//  AmongUs
//
//  Created by HHumorous on 20/11/2020.
//

import UIKit
import Alamofire
import ObjectMapper

enum StatusCode: Int {
    case Success = 200
    case Fail = 999
}

typealias APIParams = [String: Any]
typealias APICallback = (_ success: Bool, _ model: [String: Any]) -> Void
typealias ResponseDictionary = [String: Any]

class BaseAPI {
    static let shared = BaseAPI()
    
    func requestAPI(path: String, method: HTTPMethod, params: APIParams, callback: @escaping APICallback) {
        let headers: HTTPHeaders = ["Authorization": "toanle1234"]
        let url = SERVER_URL.API + path

        let request = Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers)
        
        request.responseJSON { (data) in
            if data.response?.statusCode == StatusCode.Success.rawValue {
                if let result = data.result.value as? [String: Any] {
                    callback(true, result)
                } else {
                    callback(false, [:])
                }
            } else {
                callback(false, [:])
            }
        }
    }
}

//MARK: - API Request

class APIRequest {
    private var alarmofireDataRequest: DataRequest? = nil;
    
    required init(alarmofireDataRequest request: DataRequest){
        alarmofireDataRequest = request;
    }
    
    func cancel() {
        if let request = alarmofireDataRequest {
            request.cancel();
        }
    }
}
