//
//  RegisterAddressViewController.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import UIKit

class RegisterAddressViewController: BaseViewController {
    
    let registerAddressView = RegisterAddressView()
    let service = NetworkManager()
    
    override func loadView() {
        self.view = registerAddressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        registerAddressView.delegate = self
    }
}

extension RegisterAddressViewController: RegisterAdressProtocol {
    
    func tappedCEP() {
        
        service.loadRequest(cep: registerAddressView.cepTextField.text ?? "") { result in
            
            switch result {
            case .success(let cep):
                DispatchQueue.main.async {
                    
                    guard let cep = cep else { return }
                    self.registerAddressView.loadFromCep(cep: cep)
                    
                    self.registerAddressView.confirmButton.isHidden = false
                    self.registerAddressView.confirmCep.isHidden = true
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func tappedLogin() {
        
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

