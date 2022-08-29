//
//  ViewController2.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    private let initialView: InitialView = {
        let initialView = InitialView()
        initialView.translatesAutoresizingMaskIntoConstraints = false
        return initialView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupView()
        initialView.delegate = self
        
    }
    
}
extension InitialViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(initialView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            initialView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            initialView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            initialView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            initialView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    func setupAdditionalConfiguration() {
        self.navigationController?.navigationBar.tintColor = UIColor(named: "mainYellow")
        navigationItem.backButtonTitle = "Voltar"
    }
}
extension InitialViewController: InitialViewProtocol {
    func tappedRegister() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    func tappedLogin() {
        print("")
    }
}
