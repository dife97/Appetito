//
//  AppetitoTextField.swift
//  Appetito
//
//  Created by Diego Rodrigues on 30/09/22.
//

import UIKit

class AppetitoTextField: UIView {
    
    var text: String {
        get { textFieldIsEmpty ? textField.text! : "" }
        
        set { textField.text = newValue }
    }
    
    private var textFieldIsEmpty: Bool {
        textField.text == "" ? false : true
    }
    
    var placeholder: String
    
    var isPassword: Bool
    
    var textFieldClearButton: UITextField.ViewMode
    
    var keyboardType: UIKeyboardType
    
    var didTapReturnKeyboard: (() -> Void)?
    
    var didChangeSelection: (() -> Void)?
    
    private let insets = UIEdgeInsets(
        top: 8,
        left: 12,
        bottom: 8,
        right: 12
    )
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        return label
    }()
    
    private lazy var textField: CustomTextField = {
        let textfield = CustomTextField(insets: insets)
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.tintColor = UIColor(named: "mainYellow")
        textfield.placeholder = placeholder
        textfield.keyboardType = keyboardType
        textfield.clearButtonMode = textFieldClearButton
        textfield.isSecureTextEntry = isPassword
        textfield.backgroundColor = .white
        textfield.textColor = UIColor.black
        
        return textfield
    }()
    
    
    init(labelText: String = "",
         placeholder: String = "",
         keyboardType: UIKeyboardType = .default,
         clearButton: UITextField.ViewMode = .whileEditing,
         isPassword: Bool = false) {
        
        self.isPassword = isPassword
        self.textFieldClearButton = clearButton
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        
        super.init(frame: .zero)
        
        self.label.text = labelText
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppetitoTextField: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        addSubview(label)
        addSubview(textField)
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension AppetitoTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapReturnKeyboard?()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.textField.layer.borderColor = CGColor(red: 0.976, green: 0.718, blue: 0.169, alpha: 1)
        self.textField.layer.borderWidth = 2
        self.label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.label.textColor = UIColor(named: "mainYellow")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.textField.layer.borderColor = UIColor.systemGray.cgColor
        self.textField.layer.borderWidth = 0
        self.label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.label.textColor = .white
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        didChangeSelection?()
    }
}

final class CustomTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets) {
        self.insets = insets
        
        super.init(frame: .zero)
        
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        
        layer.cornerRadius = 8
        layer.borderWidth = 1.5
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: insets)
    }
}
