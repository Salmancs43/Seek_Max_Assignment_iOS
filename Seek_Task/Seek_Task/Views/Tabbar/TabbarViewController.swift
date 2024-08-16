//
//  TabbarViewController.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import UIKit

class TabbarViewController: UITabBarController {

    var coordinator: MainCoordinating
    var service: NetworkServicingProtocol
    
    init(coordinator: MainCoordinating, service: NetworkServicingProtocol) {
        self.coordinator = coordinator
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVCs()
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorPalette.backgroundBrand.color
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        } else {
            tabBar.backgroundColor = ColorPalette.backgroundBrand.color
            tabBar.isTranslucent = false
        }
    }
    
    
    func setupVCs() {
        viewControllers = [JobsViewController(viewModel: JobsViewModel(cordinator: coordinator, service: service))]
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
