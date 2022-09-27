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
    
    private lazy var nameLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        subTitleLabel.text = "Usuario: "
        subTitleLabel.textColor = .white
        
        return subTitleLabel
    }()
    
    private lazy var phoneLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        subTitleLabel.text = "Telefone: "
        subTitleLabel.textColor = .white
        
        return subTitleLabel
    }()
    
    private lazy var emailLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        subTitleLabel.text = "E-mail: "
        subTitleLabel.textColor = .white
        
        return subTitleLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        subTitleLabel.text = "Senha: "
        subTitleLabel.textColor = .white
        
        return subTitleLabel
    }()
    
    
    lazy var userTextField: UITextField = {
        let registerUser = UITextField(frame: .zero)
        registerUser.translatesAutoresizingMaskIntoConstraints = false
        registerUser.backgroundColor = .white
        registerUser.delegate = self
        registerUser.layer.cornerRadius = 8
        registerUser.placeholder = "  Digite seu usuario"
        registerUser.textColor = UIColor.black
        registerUser.clearButtonMode = .whileEditing
        return registerUser
    }()
    
    lazy var passwordTextField: UITextField = {
        let registerPassword = UITextField(frame: .zero)
        registerPassword.translatesAutoresizingMaskIntoConstraints = false
        registerPassword.backgroundColor = .white
        registerPassword.delegate = self
        registerPassword.layer.cornerRadius = 8
        registerPassword.placeholder = "  Digite sua senha"
        registerPassword.textColor = UIColor.black
        registerPassword.isSecureTextEntry = true
        registerPassword.autocorrectionType = .no
        registerPassword.returnKeyType = .done
        registerPassword.textContentType = .oneTimeCode
        registerPassword.clearButtonMode = .whileEditing
        return registerPassword
    }()
    
    lazy var phoneTextField: UITextField = {
        let registerPhone = UITextField(frame: .zero)
        registerPhone.translatesAutoresizingMaskIntoConstraints = false
        registerPhone.backgroundColor = .white
        registerPhone.delegate = self
        registerPhone.layer.cornerRadius = 8
        registerPhone.placeholder = " Digite seu telefone"
        registerPhone.textColor = UIColor.black
        registerPhone.clearButtonMode = .whileEditing
        return registerPhone
    }()
    
    lazy var emailTextField: UITextField = {
        let registerEmail = UITextField(frame: .zero)
        registerEmail.translatesAutoresizingMaskIntoConstraints = false
        registerEmail.delegate = self
        registerEmail.backgroundColor = .white
        registerEmail.layer.cornerRadius = 8
        registerEmail.placeholder = "  email"
        registerEmail.keyboardType = .emailAddress
        registerEmail.autocapitalizationType = .none
        registerEmail.returnKeyType = .next
        registerEmail.placeholder = "  Digite seu email"
        registerEmail.textColor = UIColor.black
        registerEmail.clearButtonMode = .whileEditing
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
        return confirmButton
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,userTextField,passwordLabel, passwordTextField, emailLabel, emailTextField, phoneLabel, phoneTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
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
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            confirmButton.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
}
extension RegisterView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.placeholder == "Digite Seu E-mail" {
            passwordTextField.becomeFirstResponder()
        } else {
            emailTextField.endEditing(true)
            passwordTextField.endEditing(true)
        }
        
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
       
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = CGColor(red: 0.976, green: 0.718, blue: 0.169, alpha: 1)
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0
    }
}
