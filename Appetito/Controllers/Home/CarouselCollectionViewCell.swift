//
//  CarouselCollectionViewCell.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 30/08/22.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    
    lazy var churrascariaLabel: UILabel = {
        let churrascariaLabel = UILabel()
        churrascariaLabel.text = "Churrascaria"
        churrascariaLabel.translatesAutoresizingMaskIntoConstraints = false
        churrascariaLabel.textColor = .black
        churrascariaLabel.textAlignment = .center
        churrascariaLabel.font = UIFont(name:"", size:10)
        churrascariaLabel.numberOfLines = 0
        
        return churrascariaLabel
    }()
    
    lazy var hamburgueriaLabel: UILabel = {
        let hamburgueriaLabel = UILabel()
        hamburgueriaLabel.text = "Hamburguer"
        hamburgueriaLabel.translatesAutoresizingMaskIntoConstraints = false
        hamburgueriaLabel.textColor = .black
        hamburgueriaLabel.textAlignment = .center
        hamburgueriaLabel.font = UIFont(name:"", size:10)
        hamburgueriaLabel.numberOfLines = 0
        
        return hamburgueriaLabel
    }()
    
    lazy var comidaJaponesa: UILabel = {
        let comidaJaponesa = UILabel()
        comidaJaponesa.text = "Japonesa"
        comidaJaponesa.translatesAutoresizingMaskIntoConstraints = false
        comidaJaponesa.textColor = .black
        comidaJaponesa.textAlignment = .center
        comidaJaponesa.font = UIFont(name:"", size:10)
        comidaJaponesa.numberOfLines = 0
        
        return comidaJaponesa
    }()
    
    lazy var pizzariaLabel: UILabel = {
        let pizzariaLabel = UILabel()
        pizzariaLabel.text = "Pizza"
        pizzariaLabel.translatesAutoresizingMaskIntoConstraints = false
        pizzariaLabel.textColor = .black
        pizzariaLabel.textAlignment = .center
        pizzariaLabel.font = UIFont(name:"", size:10)
        pizzariaLabel.numberOfLines = 0
        
        return pizzariaLabel
    }()
    
    lazy var docesLabel: UILabel = {
        let docesLabel = UILabel()
        docesLabel.text = "Churrascaria"
        docesLabel.translatesAutoresizingMaskIntoConstraints = false
        docesLabel.textColor = .black
        docesLabel.textAlignment = .center
        docesLabel.font = UIFont(name:"", size:10)
        docesLabel.numberOfLines = 0
        
        return docesLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        contentView.backgroundColor = .green
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
    

extension CarouselCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(churrascariaLabel)
        addSubview(hamburgueriaLabel)
        addSubview(comidaJaponesa)
        addSubview(pizzariaLabel)
        addSubview(docesLabel)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            churrascariaLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            churrascariaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            churrascariaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            churrascariaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            churrascariaLabel.heightAnchor.constraint(equalToConstant: 50),
            
            hamburgueriaLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            hamburgueriaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            hamburgueriaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            hamburgueriaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            hamburgueriaLabel.heightAnchor.constraint(equalToConstant: 50),
            
            comidaJaponesa.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            comidaJaponesa.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            comidaJaponesa.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            comidaJaponesa.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            comidaJaponesa.heightAnchor.constraint(equalToConstant: 50),
            
            pizzariaLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            pizzariaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            pizzariaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            pizzariaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            pizzariaLabel.heightAnchor.constraint(equalToConstant: 50),
            
            docesLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            docesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            docesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            docesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            docesLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    
}
