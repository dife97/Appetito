//
//  ViewController.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit

class ViewController: UIViewController {

    let testButton = AppButton(
        text: "Entre com o Google",
        background: .white,
        leftImageName: "google"
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
        view.addSubview(testButton)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            testButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
    }
}



