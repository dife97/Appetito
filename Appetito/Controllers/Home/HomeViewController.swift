//
//  HomeViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    private let homeView: HomeView = {
        let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = UIColor(named: "mainBackground")
    }
}
extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(homeView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            homeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
    func setupAdditionalConfiguration() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sair", style: .plain, target: self, action: nil)
    }
}
