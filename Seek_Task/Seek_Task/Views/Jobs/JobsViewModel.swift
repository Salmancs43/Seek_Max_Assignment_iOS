//
//  JobsViewModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import Foundation

class JobsViewModel {
    var cordinator: MainCoordinating
    private var service: NetworkServicingProtocol
    var jobsReponseModel: JobsReponseModel?
    // Observable property
    var state: Observable<JobViewModelState> = Observable(.idle)
    
    init(cordinator: MainCoordinating, service: NetworkServicingProtocol) {
        self.cordinator = cordinator
        self.service = service
    }
    
    func fetchJobs() async {
        do {
            let response: JobsReponseModel = try await service.fetchData(from: "jobs/published")
            // Handle the response
            self.jobsReponseModel = response
            self.state.value = .successFetchingJobs
          
        } catch {
            // Handle the error
            self.state.value = .errorFetchingJobs
        }
    }
    func goToJobDetail(jobDetail: Jobs) {
        self.cordinator.goToJobDetail(jobDetail: jobDetail)
    }
    
}

extension JobsViewModel {
    enum JobViewModelState {
        case idle
        case errorFetchingJobs
        case successFetchingJobs
    }
}
