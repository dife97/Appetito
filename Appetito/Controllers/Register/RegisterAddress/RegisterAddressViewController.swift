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
        self.navigationController?.popToRootViewController(animated: true)
    }
}

