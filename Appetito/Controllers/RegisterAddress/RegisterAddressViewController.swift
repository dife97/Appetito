//
//  RegisterAddressViewController.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import UIKit

class RegisterAddressViewController: UIViewController {
    
    let registerAddressView = RegisterAddressView()
    
    override func loadView() {
        self.view = registerAddressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "mainBackground")
        
        configureView()
    }
    
    private func configureView() {
        registerAddressView.confirmButton.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc func didTapConfirmButton() {
        
        let alertController = UIAlertController(
            title: "Cadastrado",
            message: "",
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(title: "Ok",
                                     style: .cancel) { alert in
            self.present(HomeViewController(), animated: true)
        }
        
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true)
    }
}
