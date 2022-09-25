//
//  InfosViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 30/08/22.
//

import UIKit

class InfosViewController: BaseViewController {
    
    private let infosView: InfosView = {
        let infosView = InfosView()
        infosView.translatesAutoresizingMaskIntoConstraints = false
        return infosView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupView()
            infosView.delegate = self
    }
    
    func update(restaurant: Restaurant){
        infosView.setupInfos(restaurant)
    }
    
    @objc func didTapDismiss() {
        dismiss(animated: true)
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
    
    func setupAdditionalConfiguration() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Voltar", style: .done, target: self, action: #selector(didTapDismiss))
        navigationController?.navigationBar.tintColor = UIColor(named: "mainYellow")
        
    }
}

extension InfosViewController: InfosViewProtocol {
   
    func tappedConfirm() {
        let reservationViewController = ReservationViewController()
        self.modalPresentationStyle = .fullScreen
        navigationController?.show(reservationViewController, sender: .none)
        
    }
       
}
