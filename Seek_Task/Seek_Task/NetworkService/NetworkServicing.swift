//
//  NetworkServicing.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import Foundation

protocol NetworkServicingProtocol {
    func fetchData<T: Decodable>(from url: String) async throws -> T
    func postData<T: Decodable, U: Encodable>(from url: String, with parameters: U) async throws -> T
}
