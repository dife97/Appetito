//
//  RegisterAddressViewController.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import UIKit

class RegisterAddressViewController: UIViewController {
    
    let registerAddressView = RegisterAddressView()
    let service = NetworkManager()
    
    override func loadView() {
        self.view = registerAddressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        
        configureView()
    }
    
    private func configureView() {
        registerAddressView.confirmCep.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        
    }
    
    //MARK: - Actions
    @objc func didTapConfirmButton() {
        service.loadRequest(cep: registerAddressView.cepTextField.text ?? "") { result in
            switch result {
            case .success(let cep):
                DispatchQueue.main.async {
                    guard let cep = cep else { return }
                    self.registerAddressView.loadFromCep(cep: cep)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension RegisterViewController: RegisterAdressProtocol {
    func tappedLogin() {
        let LoginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: LoginViewController)
        navigationController.pushViewController(LoginViewController, animated: true)
    }
}
