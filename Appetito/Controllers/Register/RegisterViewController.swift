//
//  RegisterViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    private let registerView: RegisterView = {
        let registerView = RegisterView()
        registerView.translatesAutoresizingMaskIntoConstraints = false
        return registerView
    }()
    var auth: Auth?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        
        setupView()
        
        registerView.confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func didTapConfirmButton() {
        
//        let user = registerView.userTextField.text ?? ""
        let password = registerView.passwordTextField.text ?? ""
//        let phone = registerView.phoneTextField.text ?? ""
        let email = registerView.emailTextField.text ?? ""

        auth?.createUser(withEmail: email, password: password, completion: { [self] result, error in
            if error != nil {
                CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: error?.localizedDescription ?? "")
                //                print("Erro no cadastro.")
            } else {
                navigationController?.pushViewController(RegisterAddressViewController(), animated: true)

            }
        })
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
            registerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
