//
//  InfosView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 30/08/22.
//

import UIKit

protocol InfosViewProtocol: AnyObject {
    func tappedConfirm()
}

class InfosView: UIView {
    
    weak var delegate: InfosViewProtocol?
    
    private lazy var restaurantImageView: UIImageView = {
        let restaurantImageView = UIImageView()
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        restaurantImageView.contentMode = .scaleToFill
        restaurantImageView.layer.cornerRadius = 20
        restaurantImageView.layer.masksToBounds = false
        restaurantImageView.clipsToBounds = true
        restaurantImageView.backgroundColor = UIColor(named: "")
        
        
        return restaurantImageView
    }()
    
    private lazy var infosLabel: UILabel = {
        let infosLabel = UILabel(frame: .zero)
        infosLabel.translatesAutoresizingMaskIntoConstraints = false
        infosLabel.numberOfLines = 0
        infosLabel.font = UIFont(name:"KohinoorDevanagari-Light", size: 16)
        infosLabel.textColor = .white
        infosLabel.textAlignment = .center
        
        return infosLabel
    }()
    private lazy var menuButton: UIButton = {
        let menuButton = UIButton(type: .system)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.layer.cornerRadius = 8
        menuButton.backgroundColor = UIColor(named: "mainYellow")
        menuButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.setTitle("CARDÁPIO", for: .normal)
        
        return menuButton
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(named: "mainYellow")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("AGENDAR", for: .normal)
        button.addTarget(self, action: #selector(tappedConfirm), for: .touchUpInside)
        
        return button
    }()
    
    func setupInfos(_ restaurante: Restaurant){
        setupView()
        restaurantImageView.image = UIImage(named: restaurante.imageRestaurantInfos)
        infosLabel.text = restaurante.infos
    }
    
    @objc func tappedConfirm() {
        self.delegate?.tappedConfirm()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = UIColor(named: "mainBackground")
    }
}
extension InfosView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(restaurantImageView)
        addSubview(infosLabel)
        addSubview(confirmButton)
        addSubview(menuButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            restaurantImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            restaurantImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 200),
            restaurantImageView.widthAnchor.constraint(equalToConstant: 200),
            
            infosLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 24),
            infosLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            infosLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            confirmButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            
            menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            menuButton.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -16),
            menuButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
