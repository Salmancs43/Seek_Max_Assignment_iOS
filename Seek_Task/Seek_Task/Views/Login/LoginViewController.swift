//
//  LoginViewController.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 13/08/2024.
//

import UIKit

class LoginViewController: UIViewController {

    //Mark: Creating UI Component
    private lazy var stackView: UIStackView = {
       var view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 16
        view.axis = .vertical
        return view
    }()
    private lazy var labelTitle: UILabel = {
        var view = UILabel()
        view.font = .boldSystemFont(ofSize: 20.0)
        view.textColor = ColorPalette.textPrimary.color
        view.text = "Seek Assignment"
        view.textAlignment = .center
        return view
    }()
    
    private lazy var textFieldUserName: LoginTextField = {
        var view = LoginTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textFieldPassword: LoginTextField = {
        var view = LoginTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        return view
    }()
    
    private lazy var buttonLogin: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return view
    }()
    
    private lazy var buttonGuest: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addTarget(self, action: #selector(continueAsGuest), for: .touchUpInside)
        return view
    }()
    
    
    private var viewModel: LoginViewModel
    init(viewModel: LoginViewModel) {
           self.viewModel = viewModel
           super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorPalette.backgroundSecondard.color
        self.navigationItem.title = "Login"
        self.checkUserAlreadyLoggedIn()
        self.setupView()
        self.setupConstraints()
        self.setupUI()
        self.setupText()
        self.bind()

        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.labelTitle)
        self.stackView.addArrangedSubview(self.textFieldUserName)
        self.stackView.addArrangedSubview(self.textFieldPassword)
        self.stackView.addArrangedSubview(self.buttonLogin)
        self.stackView.addArrangedSubview(self.buttonGuest)
    }
    private func setupConstraints() {
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        textFieldUserName.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textFieldPassword.heightAnchor.constraint(equalToConstant: 45).isActive = true
        buttonLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    private func setupUI() {
        buttonLogin.backgroundColor = ColorPalette.buttonPrimary.color
        buttonGuest.setTitleColor(.darkGray, for: .normal)
        buttonGuest.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12.0)
    }
    
    private func setupText() {
        textFieldUserName.addBorder()
        textFieldPassword.addBorder()
        textFieldUserName.placeholder = "UserName"
        textFieldPassword.placeholder = "Password"
        buttonLogin.setTitle("Login", for: .normal)
        buttonGuest.setTitle("Continue As Guest", for: .normal)
    }
    
    @objc func loginButtonPressed() {
        Task {
            await self.viewModel.callLoginApi()
        }
    }
    
    @objc func continueAsGuest() {
        self.viewModel.goToTabBar()
    }
    
    private func checkUserAlreadyLoggedIn() {
        if (Authenticator.shared.getJwtToken() != nil) {
            //User already logged In move to next screen
            self.viewModel.goToTabBar()
        }
    }

}

extension LoginViewController {
    func bind() {
        viewModel.state.addObserver { [weak self] status in
            switch status {
            case .idle: break
            case .errorLogin:
                self?.alert(message: "Something Went Wrong. Click on Continue as guest to see the job listing")
            case .successLogin:
                self?.viewModel.goToTabBar()
            }
        }
    }
}


