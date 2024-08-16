//
//  NetworkService.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import Foundation
import Alamofire

class NetworkService: NetworkServicingProtocol {
    func fetchData<T: Decodable>(from url: String) async throws -> T {
           return try await withCheckedThrowingContinuation { continuation in
               AF.request(URLConfiguration.shared.apiBaseUrl + url)
                   .validate()
                   .responseDecodable(of: T.self) { response in
                       dump(response)
                       switch response.result {
                       case .success(let data):
                           continuation.resume(returning: data)
                       case .failure(let error):
                           continuation.resume(throwing: error)
                       }
                   }
           }
       }
    
    func postData<T: Decodable, U: Encodable>(from url: String, with parameters: U) async throws -> T {
          return try await withCheckedThrowingContinuation { continuation in
              AF.request(URLConfiguration.shared.apiBaseUrl + url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
                  .validate()
                  .responseDecodable(of: T.self) { response in
                      switch response.result {
                      case .success(let data):
                          continuation.resume(returning: data)
                      case .failure(let error):
                          continuation.resume(throwing: error)
                      }
                  }
          }
      }
}
