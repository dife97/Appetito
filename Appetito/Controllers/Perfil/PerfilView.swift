

//
//  PerfilView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 07/09/22.
//


import UIKit

protocol PerfilViewDelegate: AnyObject {
    
    func didTapSignOut()
    func didTapSaveButton()
    func didTapDeleteAccountButton()
}

class PerfilView: UIView, UITextFieldDelegate {
    
    //MARK: - Properties
    weak var delegate: PerfilViewDelegate?
    
    //MARK: - UI
    lazy var perfilImage: UIImageView = {
        let perfilImage = UIImageView()
        perfilImage.translatesAutoresizingMaskIntoConstraints = false
        perfilImage.layer.borderWidth = 2
        perfilImage.contentMode = .scaleAspectFill
        perfilImage.image = UIImage(named: "neymar")
        perfilImage.layer.masksToBounds = true
        perfilImage.layer.borderColor = UIColor.black.cgColor
        perfilImage.clipsToBounds = true
        perfilImage.layer.cornerRadius = self.bounds.size.width / 2
        
        return perfilImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:25)
        nameLabel.text = "Meu Perfil "
        nameLabel.textColor = UIColor(named: "mainYellow")
        
        return nameLabel
    }()
    
    private lazy var userLabel: UILabel = {
        let userLabel = UILabel(frame: .zero)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.numberOfLines = 0
        userLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        userLabel.text = "Usuario: "
        userLabel.textColor = .white
        
        return userLabel
    }()
        
    lazy var userTextField: UITextField = {
        let userTextField = UITextField(frame: .zero)
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.backgroundColor = .white
        userTextField.delegate = self
        userTextField.layer.cornerRadius = 8
        userTextField.placeholder = "  Digite seu usuario"
        userTextField.textColor = UIColor.black
        
        return userTextField
    }()
    
    private lazy var cellLabel: UILabel = {
        let cellLabel = UILabel(frame: .zero)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.numberOfLines = 0
        cellLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        cellLabel.text = "Celular:  "
        cellLabel.textColor = .white
        
        return cellLabel
    }()
        
    lazy var cellTextField: UITextField = {
        let cellTextField = UITextField(frame: .zero)
        cellTextField.translatesAutoresizingMaskIntoConstraints = false
        cellTextField.backgroundColor = .white
        cellTextField.delegate = self
        cellTextField.layer.cornerRadius = 8
        cellTextField.placeholder = "  Digite seu celular"
        cellTextField.textColor = UIColor.black
        
        return cellTextField
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel(frame: .zero)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.numberOfLines = 0
        emailLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        emailLabel.text = "E-mail: "
        emailLabel.textColor = .white
        
        return emailLabel
    }()
        
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField(frame: .zero)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.backgroundColor = .white
        emailTextField.delegate = self
        emailTextField.layer.cornerRadius = 8
        emailTextField.placeholder = "  Digite seu E-mail"
        emailTextField.textColor = UIColor.black
        
        return emailTextField
    }()
    
    lazy var saveButton: UIButton = {
        let saveButton = UIButton(type: .system)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.layer.cornerRadius = 8
        saveButton.backgroundColor = UIColor(named: "mainYellow")
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.setTitle("Salvar", for: .normal)
        saveButton.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        return saveButton
    }()
    
    lazy var deleteAccountButton: UIButton = {
        let redefinirButton = UIButton(type: .system)
        redefinirButton.translatesAutoresizingMaskIntoConstraints = false
        redefinirButton.layer.cornerRadius = 8
        redefinirButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        redefinirButton.setTitleColor(.white, for: .normal)
        redefinirButton.setTitle("Excluir Usuário", for: .normal)
        redefinirButton.addTarget(self, action: #selector(didTapDeleteAccountButton), for: .touchUpInside)
        return redefinirButton
    }()
    
    lazy var exitButton: UIButton = {
        let exitButton = UIButton(type: .system)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.layer.cornerRadius = 8
        exitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.setTitle("Sair da Conta", for: .normal)
        exitButton.addTarget(self, action: #selector(didTapSignOutButton), for: .touchUpInside)
        
        return exitButton
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc func didTapSignOutButton() {
        
        delegate?.didTapSignOut()
    }
    
    @objc func didTapSaveButton() {
        
        delegate?.didTapSaveButton()
    }
    
    @objc func didTapDeleteAccountButton() {
        
        delegate?.didTapDeleteAccountButton()
    }
}

extension PerfilView: ViewConfiguration{
    func buildViewHierarchy() {
        addSubview(perfilImage)
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(userLabel)
        stackView.addArrangedSubview(userTextField)
        stackView.addArrangedSubview(cellLabel)
        stackView.addArrangedSubview(cellTextField)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        addSubview(saveButton)
        addSubview(deleteAccountButton)
        addSubview(exitButton)

    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
        
            perfilImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            perfilImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            perfilImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            perfilImage.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: perfilImage.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 48),
            
            deleteAccountButton.leadingAnchor.constraint(equalTo: exitButton.leadingAnchor),
            deleteAccountButton.trailingAnchor.constraint(equalTo: exitButton.trailingAnchor),
            deleteAccountButton.bottomAnchor.constraint(equalTo: exitButton.topAnchor, constant: -16),
            
            exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -200),
            exitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            exitButton.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
}
extension   PerfilView: UITextViewDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userTextField {
            cellTextField.becomeFirstResponder()
        } else if textField == cellTextField {
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            emailTextField.resignFirstResponder()
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
