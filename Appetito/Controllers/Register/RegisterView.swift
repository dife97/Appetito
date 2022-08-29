//
//  RegisterView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit


class RegisterView: UIView {
    
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:50)
        titleLabel.text = "CADASTRO"
        titleLabel.textColor = UIColor(named: "mainYellow")
        return titleLabel
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:20)
        subTitleLabel.text = "Crie uma conta para continuar"
        subTitleLabel.textColor = .white
        return subTitleLabel
    }()
    
    
    let googleButton: AppButton = {
        let button = AppButton(
            text: "Entre com o Google",
            background: .white,
            leftImageName: "google",
            textColor: .black)
        

        return button
    }()
    
    let appleButton: AppButton = {
        let button = AppButton(
            text: "Entre com a Apple",
            background: .black,
            leftImageName: "apple", // TODO: colocar imagem da apple em branco
            textColor: .white)
            
        
        return button
    }()
    let emailButton: AppButton = {
        let button = AppButton(
            text: "Entre com o seu Email",
            background: .lightGray,
            leftImageName: "", // TODO: colocar imagem de envelope
            textColor: .black)
        
        
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appleButton, googleButton, emailButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(stackView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}
