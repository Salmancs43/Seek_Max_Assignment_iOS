//
//  MainCoordinating.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 13/08/2024.
//

import Foundation
import UIKit

protocol MainCoordinating {
    var navigationController: UINavigationController { get set }
    func goToLogin()
    func goToTabBar()
    func goToJobDetail(jobDetail: Jobs)
}
