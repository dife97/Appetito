//
//  PerfilViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 07/09/22.
//
import UIKit


class PerfilViewController: BaseViewController {
    
    private let perfilView: PerfilView = {
        let perfilView = PerfilView()
        perfilView.translatesAutoresizingMaskIntoConstraints = false
        
        return perfilView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

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
