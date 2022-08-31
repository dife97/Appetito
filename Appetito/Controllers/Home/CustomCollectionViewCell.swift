//
//  CustomCollectionViewCell.swift
//  Appetito
//
//  Created by Flavio Dobler on 2022-08-30.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    lazy var restaurantLogo: UIImageView = {
        let restaurantLogo = UIImageView()
        restaurantLogo.translatesAutoresizingMaskIntoConstraints = false
        restaurantLogo.layer.cornerRadius = 15
        restaurantLogo.contentMode = .scaleToFill
        restaurantLogo.clipsToBounds = true
        restaurantLogo.image = UIImage(named: "fogoDeChaoImage")
        
        return restaurantLogo
    }()
    
    lazy var cellBackground: UIView = {
        let cellBackground = UIView()
        cellBackground.translatesAutoresizingMaskIntoConstraints = false
        cellBackground.backgroundColor = .lightGray
        cellBackground.layer.cornerRadius = 20
        return cellBackground
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Fogo de Chão"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name:"", size:18)
        nameLabel.numberOfLines = 0
        
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        contentView.backgroundColor = UIColor(named: "mainBackground")
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension CustomCollectionViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        contentView.addSubview(cellBackground)
        contentView.addSubview(restaurantLogo)
        contentView.addSubview(nameLabel)
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cellBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            cellBackground.heightAnchor.constraint(equalToConstant: 300),
            
            restaurantLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            restaurantLogo.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor, constant: 0),
            restaurantLogo.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor, constant: 0),
            restaurantLogo.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: restaurantLogo.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
        ])
    }
    
    
}

