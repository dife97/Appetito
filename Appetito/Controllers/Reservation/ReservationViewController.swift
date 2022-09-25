//
//  ReservationViewController.swift
//  Appetito
//
//  Created by Flavio Dobler on 2022-09-01.
//

import UIKit

class ReservationViewController: BaseViewController {
    
    var occasion = "Blá blá"
    
    private let reservationView: ReservationView = {
        let reservationView = ReservationView()
        reservationView.translatesAutoresizingMaskIntoConstraints = false
        return reservationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        reservationView.delegate = self
        
        view.backgroundColor = UIColor(named: "mainBackground")
    }
}

extension ReservationViewController: ViewConfiguration {
    
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
        
        db.collection("reservations").addDocument(data: [
            "date": "date",
            "number_of_people": 1,
            "occasion": occasion
        ]) { error in
            
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            } else {
                print("Saved")
            }
        }
        
        dismiss(animated: true)
    }
}
