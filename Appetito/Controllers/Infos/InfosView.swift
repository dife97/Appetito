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
    
    weak var delegate: InfosView?
    
    private lazy var restaurantImageView: UIImageView = {
        let restaurantImageView = UIImageView()
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        restaurantImageView.contentMode = .scaleToFill
        restaurantImageView.image = UIImage(named: "appetitoLogo")
        
        return restaurantImageView
    }()
    
    private lazy var infosLabel: UILabel = {
        let infosLabel = UILabel(frame: .zero)
        infosLabel.translatesAutoresizingMaskIntoConstraints = false
        infosLabel.numberOfLines = 0
        infosLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:10)
        infosLabel.text = "Bem-vindo"
        infosLabel.textColor = .white
        
        return infosLabel
    }()
   private lazy var menuButton: UIButton = {
        let menuButton = UIButton(type: .system)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.layer.cornerRadius = 8
        menuButton.backgroundColor = UIColor(named: "mainYellow")
        menuButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        menuButton.setTitleColor(.black, for: .normal)
        menuButton.setTitle("AGENDAR", for: .normal)
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
//        button.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        
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
                
                restaurantImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                restaurantImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                restaurantImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                restaurantImageView.heightAnchor.constraint(equalToConstant: 200),
                
                infosLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 50),
                infosLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                infosLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                infosLabel.heightAnchor.constraint(equalToConstant: 300),
                
                menuButton.topAnchor.constraint(equalTo: infosLabel.bottomAnchor, constant: 50),
                menuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                menuButton.heightAnchor.constraint(equalToConstant: 48),
                
                confirmButton.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 50),
                confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
            ])
        }
        
        
    }
