//
//  MainCoordinator.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 13/08/2024.
//

import Foundation
import UIKit

class MainCoordinator: MainCoordinating {
    var navigationController: UINavigationController
    var service: NetworkServicingProtocol

    init(navigationController: UINavigationController, service: NetworkServicingProtocol) {
        self.navigationController = navigationController
        self.service = service
    }
    
    func goToLogin() {
        let viewModel = LoginViewModel(cordinator: self, service: service)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func goToTabBar() {
        let controller = TabbarViewController(coordinator: self, service: service)
        navigationController.pushViewController(controller, animated: false)
    }
    
    func goToJobDetail(jobDetail: Jobs) {
        let viewModel = JobDetailViewModel(cordinator: self, service: service, jobDetail: jobDetail)
        let viewController = JobDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
