//
//  CustomAlert.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import UIKit

class CustomAlert {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
        
    func exibe(titulo: String , mensagem: String) {
        let alertController = UIAlertController(
            title: titulo,
            message: mensagem,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: nil
        )
        
        alertController.addAction(okButton)
        controller.present(alertController, animated: true)
    }
}
