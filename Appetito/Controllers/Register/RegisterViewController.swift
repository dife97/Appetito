//
//  RegisterViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let registerView: RegisterView = {
        let registerView = RegisterView()
        registerView.translatesAutoresizingMaskIntoConstraints = false
        return registerView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        
        setupView()
        
        registerView.confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func didTapConfirmButton() {
        navigationController?.pushViewController(RegisterAddressViewController(), animated: true)
    }
}

extension RegisterViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(registerView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
