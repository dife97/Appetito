//
//  RegisterAddressView.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import UIKit

class RegisterAddressView: UIView {
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name:"KohinoorDevanagari-Light", size:50)
        label.text = "Endereço"
        label.textColor = UIColor(named: "mainYellow")
        return label
    }()
    
    private lazy var cepLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        label.text = "CEP:"
        label.textColor = .white
        return label
    }()
    
    lazy var cepTextField: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 8
        textfield.placeholder = "Ex.: 01234-000" //TODO: regex for typing only numbers
        textfield.textColor = UIColor.black
        return textfield
    }()
    
    lazy var cidadeTextField: UITextField = {
        let cidadeTextField = UITextField(frame: .zero)
        cidadeTextField.backgroundColor = .white
        cidadeTextField.layer.cornerRadius = 8
        cidadeTextField.placeholder = ""
        cidadeTextField.textColor = UIColor.black
        cidadeTextField.isHidden = true
        return cidadeTextField
    }()
    
    lazy var bairroTextField: UITextField = {
        let bairroTextField = UITextField(frame: .zero)
        bairroTextField.backgroundColor = .white
        bairroTextField.layer.cornerRadius = 8
        bairroTextField.placeholder = ""
        bairroTextField.textColor = UIColor.black
        bairroTextField.isHidden = true
        
        return bairroTextField
    }()
    
    lazy var ruaTextField: UITextField = {
        let ruaTextField = UITextField(frame: .zero)
        ruaTextField.backgroundColor = .white
        ruaTextField.layer.cornerRadius = 8
        ruaTextField.placeholder = ""
        ruaTextField.textColor = UIColor.black
        ruaTextField.isHidden = true
        
        return ruaTextField
    }()
    
    lazy var ufTextField: UITextField = {
        let ufTextField = UITextField(frame: .zero)
        ufTextField.backgroundColor = .white
        ufTextField.layer.cornerRadius = 8
        ufTextField.placeholder = ""
        ufTextField.textColor = UIColor.black
        ufTextField.isHidden = true
        
        return ufTextField
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cidadeTextField, bairroTextField, ufTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadFromCep(cep: CEPModel) {
        bairroTextField.text = cep.bairro
        bairroTextField.isHidden = false
        cidadeTextField.text = cep.localidade
        cidadeTextField.isHidden = false
        ufTextField.text = cep.uf
        ufTextField.isHidden = false
        ruaTextField.text = cep.logradouro
        ruaTextField.isHidden = false
    }
}

extension RegisterAddressView: ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(cepTextField)
        addSubview(cepLabel)
        
        stackView.addArrangedSubview(ruaTextField)
        stackView.addArrangedSubview(bairroTextField)
        stackView.addArrangedSubview(ufTextField)
        stackView.addArrangedSubview(cidadeTextField)
        addSubview(stackView)
        
        addSubview(confirmButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cepLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            cepLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            cepLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cepLabel.heightAnchor.constraint(equalToConstant: 20),
            
            cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 20),
            cepTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            cepTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cepTextField.heightAnchor.constraint(equalToConstant: 48),
            
            stackView.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            confirmButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
