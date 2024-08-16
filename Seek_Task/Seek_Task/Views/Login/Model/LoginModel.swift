//
//  LoginModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import Foundation

struct UserRequestModel: Encodable {
    var username: String?
    var password: String?
    
    init(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
}

struct UserResponseModel: Decodable {
    var token: String
    var message: String
    
    init(token: String, message: String) {
        self.token = token
        self.message = message
    }
}
