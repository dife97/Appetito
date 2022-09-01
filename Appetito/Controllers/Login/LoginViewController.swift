//
//  ViewController.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit

class LoginViewController: UIViewController{
    
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
    func setupAdditionalConfiguration() {
        navigationItem.setHidesBackButton(false, animated: true)
    }
}

extension LoginViewController: LoginViewProtocol {
    func tappedLogin() {
        let homeViewController = HomeViewController()
        let myReservationController = MyReservationViewController()
        myReservationController.tabBarItem = UITabBarItem(title: "Reservas", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"))
        myReservationController.tabBarItem.tag = 1
        let tabbar = UITabBarController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        homeViewController.tabBarItem.tag = 0
        let navigationController = UINavigationController(rootViewController: homeViewController)
        tabbar.viewControllers = [navigationController, myReservationController]
        tabbar.modalPresentationStyle = .fullScreen
        tabbar.view.backgroundColor = UIColor(named: "mainBackground")
        tabbar.tabBar.isTranslucent = false
        tabbar.view.tintColor = UIColor.white
        present(tabbar, animated: true)
        
    }
}
