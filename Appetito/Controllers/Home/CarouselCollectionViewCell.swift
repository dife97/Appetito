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
        //        churrascariaLabel.text = "Churrascaria"
        churrascariaLabel.translatesAutoresizingMaskIntoConstraints = false
        churrascariaLabel.textColor = .white
        churrascariaLabel.textAlignment = .center
        churrascariaLabel.font = UIFont(name:"", size:10)
        churrascariaLabel.numberOfLines = 0
        
        return churrascariaLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configuraCarrouCell(_ restaurant: Restaurant?){
        churrascariaLabel.text = restaurant?.category
        
    }
}


extension CarouselCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(churrascariaLabel)
        
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            churrascariaLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            churrascariaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            churrascariaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            churrascariaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            churrascariaLabel.heightAnchor.constraint(equalToConstant: 25),
            
        ])
    }
    
    
}
