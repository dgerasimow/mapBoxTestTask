//
//  FieldsRequest.swift
//  mapBoxTestTask
//
//  Created by Danil Gerasimov on 16.10.2021.
//

import Foundation
import Alamofire

class FieldsRequest {
    let url: URL
    var request: URLRequest
    init() {
        url = URL(string: "https://devtest.agggro.com/api/fields")!
    }
    
    func getTokenRequest(token: String, completion: @escaping (Field?) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": token,
            "Accept": "application/json"
        ]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        ).responseDecodable(of: Field.self) { response in
            completion(response.value)
        }
    }
}

