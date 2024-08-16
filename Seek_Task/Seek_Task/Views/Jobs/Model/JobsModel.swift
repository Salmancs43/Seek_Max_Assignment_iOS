//
//  JobsModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import Foundation
struct JobsReponseModel: Decodable {
    var page, size, total: Int?
    var hasNext: Bool?
    var jobs: [Jobs]?
}

struct Jobs: Decodable {
    var salaryRange: SalaryRange?
    var _id, positionTitle, description, createdAt, updatedAt  :String?
    var location, industry, status, __v : Int?
    var haveIApplied: Bool?
    var company: Company?
}

struct Company: Decodable {
    var _id, name, createdAt, updatedAt  :String?
}

struct SalaryRange: Decodable {
    var min, max: Int?
    
}
