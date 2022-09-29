//
//  RegisterViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: BaseViewController {
    
    var auth: Auth?
    
    private let registerView: RegisterView = {
        let registerView = RegisterView()
        registerView.translatesAutoresizingMaskIntoConstraints = false
        return registerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        setupView()
        registerView.confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }
    
    
    //MARK: - Actions
    @objc func didTapConfirmButton() {
        
        let password = registerView.passwordTextField.text ?? ""
        let email = registerView.emailTextField.text ?? ""
        
        if password.valid(.password) && email.valid(.email){
            auth?.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
                
                guard let self = self else { return }
                
                if error != nil {
                    CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: error?.localizedDescription ?? "")
                } else {
                    self.saveUserToCoreData()
                    
                    self.navigationController?.pushViewController(RegisterAddressViewController(), animated: true)
                }
            })
        } else {
            CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: "Dados invalidos")
        }
    }
    
    private func saveUserToCoreData() {
        
        guard let usersname = registerView.userTextField.text else { return }
        guard let email = registerView.emailTextField.text else { return }
        guard let phoneNumber = registerView.phoneTextField.text else { return }
        
        let userCoreData = User(context: CoreDataManager.shared.context)
        userCoreData.username = usersname
        userCoreData.email = email
        userCoreData.phoneNumber = phoneNumber
        
        CoreDataManager.shared.save()
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
