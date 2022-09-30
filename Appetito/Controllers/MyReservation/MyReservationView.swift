//
//  MyReservationView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 01/09/22.
//

import UIKit

class MyReservationView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyReservationView: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        
    }
    
    func setupContraints() {
        
        
    }
    
    func setupAdditionalConfiguration() {
        
        self.backgroundColor = UIColor(named: "mainBackground")
    }
}
