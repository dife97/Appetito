//
//  MyReservationViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 01/09/22.
//

import UIKit

class MyReservationViewController: UIViewController {

    
    private let myReservationView: MyReservationView = {
        let reservationView = MyReservationView()
        reservationView.translatesAutoresizingMaskIntoConstraints = false
        
        return reservationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor(named: "mainBackground")
    }
}

extension MyReservationViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(myReservationView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
                myReservationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                myReservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                myReservationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                myReservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    
    
}
