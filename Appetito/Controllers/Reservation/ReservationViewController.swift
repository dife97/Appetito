//
//  ReservationViewController.swift
//  Appetito
//
//  Created by Flavio Dobler on 2022-09-01.
//

import UIKit

class ReservationViewController: UIViewController {
    
    private let reservationView: ReservationView = {
        let reservationView = ReservationView()
        reservationView.translatesAutoresizingMaskIntoConstraints = false
        return reservationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        reservationView.delegate = self
        self.view.backgroundColor = UIColor(named: "mainBackground")
       
    }
}

extension ReservationViewController : ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(reservationView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
                reservationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                reservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                reservationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                reservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                
                
        ])
    }
    
    
}
extension ReservationViewController: ReservationViewProtocol {
    func tappedConfirm() {
        self.dismiss(animated: true)
    }
}
