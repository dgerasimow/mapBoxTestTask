//
//  AuthorizationStruct.swift
//  mapBoxTestTask
//
//  Created by Danil Gerasimov on 16.10.2021.
//

import Foundation

struct AuthorizationStruct: Decodable {
    let refresh: String
    let access: String
}
