//
//  JobsRequestModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import Foundation
struct JobsRequestModel: Encodable {
    var perPage: Int?
    init(perPage: Int? = nil) {
        self.perPage = perPage
    }
}
