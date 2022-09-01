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
        restaurantImageView.contentMode = .scaleAspectFit
        restaurantImageView.image = UIImage(named: "fogoChaoBanner")
        restaurantImageView.layer.cornerRadius = 8
        restaurantImageView.backgroundColor = .black
        
        return restaurantImageView
    }()
    
    private lazy var infosLabel: UILabel = {
        let infosLabel = UILabel(frame: .zero)
        infosLabel.translatesAutoresizingMaskIntoConstraints = false
        infosLabel.numberOfLines = 0
        infosLabel.font = UIFont(name:"KohinoorDevanagari-Light", size: 16)
        infosLabel.textColor = .white
        infosLabel.textAlignment = .center
        infosLabel.text = "Fogo de Chão é o nome e o símbolo deste famoso rodízio. Faz referência aos primórdios do churrasco, quando os gaúchos aprenderam que, assando partes do boi em espetos de madeira dispostos ao redor de uma fogueira, convertiam um simples pedaço de carne, em uma iguaria. O animal, o corte e a perícia do assador são os três elementos fundamentais para a preparação de um bom churrasco e no Fogo de Chão, a carne é de Angus, os churrasqueiros são \"experts\" e o serviço é absolutamente perfeito. (Última atualização: setembro 2020)."
        
        
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
        //        button.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedConfirm() {
        self.delegate?.tappedConfirm()
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
//            infosLabel.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -16),
//            infosLabel.bottomAnchor.constraint(equalToConstant: 300),
            
            
//            confirmButton.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 50),
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            confirmButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            
//            menuButton.topAnchor.constraint(equalTo: infosLabel.bottomAnchor, constant: 50),
            menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            menuButton.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -16),
            menuButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = UIColor(named: "mainBackground")
    }
}
