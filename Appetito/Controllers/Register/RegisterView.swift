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
        titleLabel.text = "Cadastre-se"
        titleLabel.textColor = UIColor(named: "mainYellow")
        
        return titleLabel
    }()

    private lazy var registerUser: UITextField = {
        let registerUser = UITextField(frame: .zero)
        registerUser.translatesAutoresizingMaskIntoConstraints = false
        registerUser.backgroundColor = .white
        registerUser.layer.cornerRadius = 8
        registerUser.placeholder = "  usuario"
        registerUser.textColor = UIColor.black
        

        return registerUser
        }()
    
    private lazy var registerPassword: UITextField = {
        let registerPassword = UITextField(frame: .zero)
        registerPassword.translatesAutoresizingMaskIntoConstraints = false
        registerPassword.backgroundColor = .white
        registerPassword.layer.cornerRadius = 8
        registerPassword.placeholder = "  senha"
        registerPassword.textColor = UIColor.black

        return registerPassword
        }()
    
    private lazy var registerPhone: UITextField = {
        let registerPhone = UITextField(frame: .zero)
        registerPhone.translatesAutoresizingMaskIntoConstraints = false
        registerPhone.backgroundColor = .white
        registerPhone.layer.cornerRadius = 8
        registerPhone.placeholder = "  telefone"
        registerPhone.textColor = UIColor.black

        return registerPhone
        }()
    
    private lazy var registerEmail: UITextField = {
        let registerEmail = UITextField(frame: .zero)
        registerEmail.translatesAutoresizingMaskIntoConstraints = false
        registerEmail.backgroundColor = .white
        registerEmail.layer.cornerRadius = 8
        registerEmail.placeholder = "  email"
        registerEmail.textColor = UIColor.black

        return registerEmail
        }()
    
    lazy var confirmButton: UIButton = {
        let confirmButton = UIButton(type: .system)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.layer.cornerRadius = 8
        confirmButton.backgroundColor = UIColor(named: "mainYellow")
        confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        confirmButton.setTitleColor(.black, for: .normal)
        confirmButton.setTitle("CONFIRMAR", for: .normal)
//        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return confirmButton
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [registerUser, registerPassword, registerEmail, registerPhone])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
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
        addSubview(stackView)
        addSubview(confirmButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            confirmButton.heightAnchor.constraint(equalToConstant: 48)
            
            ])
    }
}
