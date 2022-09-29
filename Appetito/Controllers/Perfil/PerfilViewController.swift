//
//  PerfilViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 07/09/22.
//

import UIKit
import FirebaseAuth

class PerfilViewController: BaseViewController {
    
    var user: User?
    
    private let perfilView: PerfilView = {
        let perfilView = PerfilView()
        perfilView.translatesAutoresizingMaskIntoConstraints = false
        
        return perfilView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        self.view.backgroundColor = UIColor(named: "mainBackground")
        
        perfilView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getCachedUser()
    }
    
    private func getCachedUser() {
        
        user = CoreDataManager.shared.fetchUser()
        
        didGetCachedUser(user: user)
    }
    
    private func didGetCachedUser(user: User?) {
        
        guard let user = user else { return }
        
        perfilView.userTextField.text = user.username
        perfilView.cellTextField.text = user.phoneNumber
        perfilView.emailTextField.text = user.email
    }
    
    private func uncacheUser() {
        
        guard let user = user else { return }
        
        CoreDataManager.shared.persistencContainer.viewContext.delete(user)
        
        CoreDataManager.shared.save()
    }
}

extension PerfilViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        view.addSubview(perfilView)
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            perfilView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            perfilView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            perfilView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            perfilView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

extension PerfilViewController: PerfilViewDelegate {
    
    func didTapSignOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            
            let navigationController = UINavigationController(rootViewController: InitialViewController())
            navigationController.modalPresentationStyle = .fullScreen
            
            show(navigationController, sender: self)
        } catch let error as NSError {
            print("[PerfilViewController] Error to sign out: \(error.localizedDescription)")
        }
    }
    
    func didTapSaveButton() {
        
        //        guard let user = user else { return }
        
        user?.username = perfilView.userTextField.text
        user?.phoneNumber = perfilView.cellTextField.text
        user?.email = perfilView.emailTextField.text
        
        CoreDataManager.shared.save()
    }
    
    func didTapDeleteAccountButton() {
        
        let user = Auth.auth().currentUser
        
        user?.delete { error in
            if let error = error {
                print("Erro = \(error.localizedDescription)")
            } else {
                
                DispatchQueue.main.async {
                    
                    let alert = CustomAlert(controller: self)
                    
                    alert.handlerFunction = { [weak self] in
                        
                        self?.uncacheUser()
                        
                        let initialController = InitialViewController()
                        
                        let navigationController = UINavigationController(rootViewController: initialController)
                        
                        navigationController.modalPresentationStyle = .fullScreen
                        
                        self?.show(navigationController, sender: self)
                    }
                    
                    alert.exibe(
                        titulo: "Usuário deletado com sucesso",
                        mensagem: "Até a próxima :)"
                    )
                }
            }
        }
    }
}
