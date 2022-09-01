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
        self.view.backgroundColor = UIColor(named: "mainBackground")
       
        
    }
}

extension ReservationViewController : ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(reservationView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    
}
