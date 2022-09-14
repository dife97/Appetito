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
    
    private lazy var cepTextField: UITextField = {
        let textfield = UITextField(frame: .zero)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.layer.cornerRadius = 8
        textfield.placeholder = "Ex.: 01234-000" //TODO: regex for typing only numbers
        textfield.textColor = UIColor.black
        return textfield
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
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
}

extension RegisterAddressView: ViewConfiguration {
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        
        stackView.addArrangedSubview(cepLabel)
        stackView.addArrangedSubview(cepTextField)
        addSubview(stackView)
        
        addSubview(confirmButton)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cepTextField.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
//            stackView.heightAnchor.constraint(equalToConstant: 400),
            
            confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            confirmButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
