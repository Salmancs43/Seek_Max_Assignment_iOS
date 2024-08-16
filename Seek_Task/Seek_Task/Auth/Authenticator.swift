//
//  AuthViewModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import Foundation


class Authenticator {
    let JWT_TOKEN = "jwt_token"
    static var shared: Authenticator = Authenticator()
    private init() {
        
    }
    
    func saveJwtToken(jwtToken: String) {
        UserDefaults.standard.set(jwtToken, forKey: JWT_TOKEN)
    }
    
    func getJwtToken() -> String? {
        if let jwtToken = UserDefaults.standard.value(forKey: JWT_TOKEN) as? String {
            return jwtToken
        }
        return nil
    }
}
