//
//  AuthorizationRequest.swift
//  mapBoxTestTask
//
//  Created by Danil Gerasimov on 16.10.2021.
//

import Foundation
import Alamofire


class AuthorizationRequest {
    let url: URL
    init() {
        url = URL(string: "https://devtest.agggro.com/api/auth/token")!
    }
    
    func getTokenRequest(completion: @escaping (AuthorizationStruct?) -> Void) {
        let parameters: [String: String] = [
            "username": "farmer-user",
            "password": "123login123"
        ]
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        ).responseDecodable(of: AuthorizationStruct.self) { response in
            completion(response.value)
        }
    }
}

