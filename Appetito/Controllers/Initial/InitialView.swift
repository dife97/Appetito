//
//  RegisterView.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit

protocol InitialViewProtocol: AnyObject {
    func tappedRegister()
    func tappedLogin()
}

class InitialView: UIView {
    
    weak var delegate: InitialViewProtocol?
    
    private lazy var imageViewBackGround: UIImageView = {
        let imageViewBackGround = UIImageView()
        imageViewBackGround.translatesAutoresizingMaskIntoConstraints = false
        imageViewBackGround.contentMode = .scaleToFill
        imageViewBackGround.image = UIImage(named: "appetitoLogo")
        return imageViewBackGround
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:30)
        titleLabel.text = "Pegar fila nunca foi tão facil"
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:16)
        subTitleLabel.text = "mais de 1.000 restaurantes cadastrados"
        subTitleLabel.textColor = UIColor(named: "mainYellow")
        return subTitleLabel
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(named: "mainYellow")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("ENTRAR", for: .normal)
        button.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(named: "mainYellow")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("CADASTRAR", for: .normal)
        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return button
    }()
    
    // MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedLogin() {
        self.delegate?.tappedLogin()
    }
    
    @objc func tappedRegister() {
        self.delegate?.tappedRegister()
    }
}

extension InitialView: ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(imageViewBackGround)
        addSubview(titleLabel)
        addSubview(mainButton)
        addSubview(subTitleLabel)
        addSubview(registerButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            imageViewBackGround.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageViewBackGround.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageViewBackGround.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            imageViewBackGround.heightAnchor.constraint(equalToConstant: 434),
            
            titleLabel.topAnchor.constraint(equalTo: imageViewBackGround.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 37),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -37),
            titleLabel.heightAnchor.constraint(equalToConstant: 90),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 37),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -37),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            mainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            mainButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -16),
            mainButton.heightAnchor.constraint(equalToConstant: 48),
            
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            registerButton.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor(named: "mainBackground")
        
    }
}
