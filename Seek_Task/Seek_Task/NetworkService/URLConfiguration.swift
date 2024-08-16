//
//  URLConfiguration.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import Foundation
struct URLConfiguration {
    static var shared: URLConfiguration = URLConfiguration()
    /// Private initializer.
    private init() {}
    /// Set base on enviroment UAT, SIT, PROD
    let apiBaseUrl = "http://localhost:3001/"
}
