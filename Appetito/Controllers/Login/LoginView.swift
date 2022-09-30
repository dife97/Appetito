//
//  RegisterView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 29/08/22.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func tappedLogin()
}

class LoginView: UIView, UITextFieldDelegate {
    
    weak var delegate: LoginViewProtocol?
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:50)
        titleLabel.text = "Bem-vindo"
        titleLabel.textColor = UIColor(named: "mainYellow")
        
        return titleLabel
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:20)
        subTitleLabel.text = "Coloque seu login e senha"
        subTitleLabel.textColor = .white
        
        return subTitleLabel
    }()
    
    lazy var loginTextField: AppetitoTextField = {
        let textfield = AppetitoTextField(
            labelText: "Usuário",
            placeholder: "Digite seu e-mail ou usuário",
            keyboardType: .emailAddress
        )
        
        textfield.didTapReturnKeyboard = { self.passwordTextField.becomeFirstResponder() }
        
        textfield.didChangeSelection = {
            
            //TODO: insert regex here
        }
        
        return textfield
    }()
    
//    lazy var loginTextField: UITextField = {
//        let loginTextField = UITextField(frame: .zero)
//        loginTextField.translatesAutoresizingMaskIntoConstraints = false
//        loginTextField.backgroundColor = .white
//        loginTextField.layer.cornerRadius = 8
//        loginTextField.placeholder = "  Digite seu e-mail ou usuario"
//        loginTextField.textColor = UIColor.black
//        loginTextField.clearButtonMode = .whileEditing
////        loginTextField.text = "appetito@appetito.com"
//        return loginTextField
//    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: .zero)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.placeholder = "  Digite sua senha"
        passwordTextField.textColor = UIColor.black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
//        passwordTextField.text = "12345678"
        return passwordTextField
    }()
    
    lazy var lostPasswordButton: UIButton = {
        let lostPasswordButton = UIButton(type: .system)
        lostPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        lostPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lostPasswordButton.setTitleColor(.white, for: .normal)
        lostPasswordButton.setTitle("Esqueci minha senha", for: .normal)
        return lostPasswordButton
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
    
    let googleButton: AppButton = {
        let button = AppButton(
            text: "Entrar com o Google",
            background: .white,
            leftImageName: "google",
            textColor: .black
        )
        
        return button
    }()
    
    let appleButton: AppButton = {
        let button = AppButton(
            text: "Entrar com a Apple",
            background: .black,
            leftImageName: "appleS", // TODO: colocar imagem da apple em branco
            textColor: .white
        )
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [googleButton, appleButton ])
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
//        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @objc func tappedLogin(){
        self.delegate?.tappedLogin()
    }
}

extension LoginView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(lostPasswordButton)
        addSubview(mainButton)
        addSubview(stackView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            loginTextField.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 50),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            loginTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            lostPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            lostPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            lostPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            lostPasswordButton.heightAnchor.constraint(equalToConstant: 46),
            
            
            mainButton.topAnchor.constraint(equalTo: lostPasswordButton.bottomAnchor, constant: 16),
            mainButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            mainButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            mainButton.heightAnchor.constraint(equalToConstant: 48),
            
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 111)
            
        ])
    }
    
}
extension LoginView: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
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
