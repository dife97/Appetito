//
//  ReservationView.swift
//  Appetito
//
//  Created by Flavio Dobler on 2022-09-01.
//

import UIKit

class ReservationView: UIView {

    lazy var calendar : UIDatePicker = {
        let date = UIDatePicker()
        date.locale = .current
        date.date = Date()
        date.preferredDatePickerStyle = .compact
        return date
    }()

    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildViewHierarchy()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension ReservationView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(calendar)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            calendar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            calendar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            calendar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 160)
        
        ])
    }
    
    
}
