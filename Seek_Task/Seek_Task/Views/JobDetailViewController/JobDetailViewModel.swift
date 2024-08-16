//
//  JobDetailViewModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import Foundation

class JobDetailViewModel {
    var cordinator: MainCoordinating
    private var service: NetworkServicingProtocol
    var jobDetail: Jobs
    
    init(cordinator: MainCoordinating, service: NetworkServicingProtocol, jobDetail: Jobs) {
        self.cordinator = cordinator
        self.service = service
        self.jobDetail = jobDetail
    }
   
}
