//
//  ViewController.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit



class LoginViewController: UIViewController {
    
    private let loginView: LoginView = {
        let loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        setupView()
    }
}
extension LoginViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(loginView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            loginView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}
