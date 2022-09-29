//
//  ViewController.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: BaseViewController {
    
    var auth: Auth?
    
    private let loginView: LoginView = {
        let loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        setupView()
        loginView.delegate = self
        self.auth = Auth.auth()
    }
}
extension LoginViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(loginView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    func setupAdditionalConfiguration() {
        navigationItem.setHidesBackButton(false, animated: true)
    }
}

extension LoginViewController: LoginViewProtocol {
    func tappedLogin() {
        let password = loginView.passwordTextField.text ?? ""
        let email = loginView.loginTextField.text ?? ""
        if password.valid(.password) && email.valid(.email) {
            auth?.signIn(withEmail: email, password: password, completion: { [self] user, error in
                if error != nil {
                    CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: error?.localizedDescription ?? "")
                } else {
                    if user == nil {
                        CustomAlert(controller: self).exibe(titulo: "error", mensagem: error?.localizedDescription ?? "")
                    } else {
                        let homeViewController = HomeViewController()
                        let myReservationController = MyReservationViewController()
                        let perfilViewController = PerfilViewController()
                        
                        myReservationController.tabBarItem = UITabBarItem(title: "Reservas", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"))
                        myReservationController.tabBarItem.tag = 1
                        
                        let tabbar = UITabBarController()
                        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
                        homeViewController.tabBarItem.tag = 0
                        perfilViewController.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
                        perfilViewController.tabBarItem.tag = 2
                        
                        let navigationController = UINavigationController(rootViewController: homeViewController)
                        tabbar.viewControllers = [navigationController, myReservationController, perfilViewController]
                        tabbar.modalPresentationStyle = .fullScreen
                        tabbar.view.backgroundColor = UIColor(named: "mainBackground")
                        tabbar.tabBar.isTranslucent = false
                        tabbar.view.tintColor = UIColor.white
                        present(tabbar, animated: true)
                    }
                }
            })
        } else {
            CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: "E-mail Invalido")
        }
        
    }
}




