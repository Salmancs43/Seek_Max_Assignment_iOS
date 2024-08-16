//
//  LoginViewModel.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 13/08/2024.
//

import Foundation

class LoginViewModel {
    var cordinator: MainCoordinating
    var service: NetworkServicingProtocol
    
    // Observable property for the login status
    var state: Observable<LoginViewModelState> = Observable(.idle)
    
    init(cordinator: MainCoordinating, service: NetworkServicingProtocol) {
        self.cordinator = cordinator
        self.service = service
    }
    
    func callLoginApi() async {
        let parameters = UserRequestModel(username: "Seeker1123", password: "123456")
        do {
            let response: UserResponseModel = try await service.postData(from: "auth", with: parameters)
            //If get successfull response than save the token into Keychain, userdefaults.
            Authenticator.shared.saveJwtToken(jwtToken: response.token)
            self.state.value = .successLogin
        } catch {
            // Handle the error
            self.state.value = .errorLogin
        }
    }
    
    func goToTabBar() {
        self.cordinator.goToTabBar()
    }
    
}

extension LoginViewModel {
    enum LoginViewModelState {
        case idle
        case errorLogin
        case successLogin
    }
}
