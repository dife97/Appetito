//
//  InfosViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 30/08/22.
//

import UIKit

class InfosViewController: UIViewController {

    private let infosView: InfosView = {
        let infosView = InfosView()
        infosView.translatesAutoresizingMaskIntoConstraints = false
        return infosView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension InfosViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(infosView)
        
    }

    func setupContraints() {
        NSLayoutConstraint.activate([
        infosView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        infosView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        infosView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        infosView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
extension InfosViewController: InfosViewProtocol {
    func tappedConfirm() {
//        let registerViewController = TODO: confirmar pra proxima tela
//        navigationController?.pushViewController(registerViewController, animated: true)
//    }
    
    
}
}