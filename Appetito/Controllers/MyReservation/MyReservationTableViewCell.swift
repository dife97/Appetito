//
//  myReservationTableViewCell.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 26/09/22.
//

import UIKit

class MyReservationTableViewCell: UITableViewCell {

    static let identifier = "myReservationTableViewCell"
    
    lazy var restaurantLabel: UILabel = {
        let restaurantLabel = UILabel()
        restaurantLabel.text = "Fogo de Chão"
        restaurantLabel.textColor = .white
        restaurantLabel.textAlignment = .center
        restaurantLabel.font = UIFont(name:"", size:18)
        restaurantLabel.numberOfLines = 0
        
        return restaurantLabel
    }()
    
    lazy var dataLabel: UILabel = {
        let dataLabel = UILabel()
        dataLabel.text = "28/09/2022"
        dataLabel.textColor = .white
        dataLabel.textAlignment = .center
        dataLabel.font = UIFont(name:"", size:18)
        dataLabel.numberOfLines = 0
        
        return dataLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [restaurantLabel, dataLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.backgroundColor = UIColor(named: "mainBackground")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MyReservationTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(stackView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}
