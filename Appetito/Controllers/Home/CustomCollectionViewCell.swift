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
        restaurantLogo.layer.borderWidth = 2
        restaurantLogo.layer.borderColor = UIColor.black.cgColor
//        restaurantLogo.image = UIImage(named: "fogoDeChaoImage")
        restaurantLogo.layer.masksToBounds = false
        restaurantLogo.clipsToBounds = true
        restaurantLogo.layer.cornerRadius = 50
        return restaurantLogo
    }()
    
    lazy var cellBackground: UIView = {
        let cellBackground = UIView()
        cellBackground.translatesAutoresizingMaskIntoConstraints = false
        cellBackground.backgroundColor = UIColor(named: "mainCollection")
        cellBackground.layer.cornerRadius = 20
        return cellBackground
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Fogo de Chão"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name:"", size:18)
        nameLabel.numberOfLines = 0
        
        return nameLabel
    }()
    
    lazy var notaLabel: UILabel = {
        let nota = UILabel()
        nota.text = "4.5"
        nota.translatesAutoresizingMaskIntoConstraints = false
        nota.textColor = .white
        nota.textAlignment = .center
        nota.font = UIFont(name:"", size:18)
        nota.numberOfLines = 0
        return nota
    }()
    
    lazy var starImageView: UIImageView = {
        let star = UIImageView()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.image = UIImage(named: "star")
        star.contentMode = .scaleAspectFit
        return star
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        contentView.backgroundColor = UIColor(named: "mainBackground")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configuraCell(_ restaurant: Restaurant?){
        restaurantLogo.image = UIImage(named: restaurant?.imagemRestaurant ?? "")
        nameLabel.text = restaurant?.nameRestaurant
        notaLabel.text = restaurant?.note
        starImageView.image = UIImage(named:restaurant?.imageNote ?? "")

    }
}

extension CustomCollectionViewCell: ViewConfiguration {
    
    func buildViewHierarchy() {
        contentView.addSubview(cellBackground)
        contentView.addSubview(restaurantLogo)
        contentView.addSubview(nameLabel)
        contentView.addSubview(notaLabel)
        contentView.addSubview(starImageView)
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            
            cellBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cellBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cellBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cellBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            cellBackground.heightAnchor.constraint(equalToConstant: 300),
            
            restaurantLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            restaurantLogo.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor, constant: 20),
            restaurantLogo.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor, constant: -20),
            restaurantLogo.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: restaurantLogo.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: cellBackground.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: cellBackground.trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            notaLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
            notaLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            notaLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            starImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 5),
            starImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            starImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            starImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
}

