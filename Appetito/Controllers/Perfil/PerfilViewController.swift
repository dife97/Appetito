//
//  PerfilViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 07/09/22.
//

import UIKit
import FirebaseAuth

class PerfilViewController: BaseViewController {
    
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
}
