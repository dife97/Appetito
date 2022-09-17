//
//  AppetitoTextField.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 15/09/22.
//
import UIKit

class AppetitoTextField: UIView {
    
    //MARK: - Properties
    var text: String {
        get { textFieldIsEmpty ? mainTextfield.text! : "" }
        set { mainTextfield.text = newValue }
    }
    
    var textFieldIsEmpty: Bool {
        mainTextfield.text == "" ? false : true
    }
    
    var placeholder: String
    var PPKeyboardType: UIKeyboardType
    var isPassword: Bool
    var textFieldClearButton: UITextField.ViewMode
    
    lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapPPTextField(_:)))
        return tap
    }()
    
    var checkerFunction: (() -> Void)?
    
    //MARK: - UI Components
    private lazy var innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = CGColor(red: 0.976, green: 0.718, blue: 0.169, alpha: 1)
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
//        label.font = scheme.poppins(weight: .semibold, size: scheme.textFieldFontSize)
        label.textColor = .black
        return label
    }()
    
    lazy var mainTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.isHidden = true
        textfield.tintColor = .black
        textfield.placeholder = placeholder
        textfield.keyboardType = PPKeyboardType
        textfield.clearButtonMode = textFieldClearButton
        textfield.isSecureTextEntry = true
        textfield.font = .italicSystemFont(ofSize: 8)
        return textfield
    }()
    
    private lazy var rightImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.tintColor = .black
        return imageview
    }()
    
    //MARK: - Initializers
    init(labelText: String,
         placeholder: String = "",
         keyboardType: UIKeyboardType = .default,
         clearButton: UITextField.ViewMode = .whileEditing,
         isPassword: Bool = false) {
        
        self.isPassword = isPassword
        self.textFieldClearButton = clearButton
        self.placeholder = placeholder
        self.PPKeyboardType = keyboardType
        
        super.init(frame: .zero)
        
        configureOuterView()
        configureInnerView()
        configureLabel(text: labelText)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 50, height: 30)
    }
    
    //MARK: - Views Config
    private func configureOuterView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = CGFloat(20.0)
        backgroundColor = .black
        
        addGestureRecognizer(tap)
    }
    
    private func configureInnerView() {
        addSubview(innerView)
        
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: topAnchor),
            innerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            innerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Default Config
    private func configureLabel(text: String) {
        addSubview(label)
        
        label.text = "  \(text)  "
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureTextField() {
        
        innerView.addSubview(mainTextfield)
        
        NSLayoutConstraint.activate([
            mainTextfield.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 18),
            mainTextfield.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -12),
            mainTextfield.bottomAnchor.constraint(equalTo: innerView.bottomAnchor, constant: -8),
            mainTextfield.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: - Actions
    @objc func didTapPPTextField(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.ended {
            startAnimation()
        }
    }
    
    func disableTextField() {
        mainTextfield.isEnabled = false
        removeGestureRecognizer(self.tap)
    }
    
    func enableTextField() {
        addGestureRecognizer(self.tap)
    }
}

//MARK: - Animation Control
extension AppetitoTextField {
    
    func startAnimation() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: []) {
            self.didStartFocus()
            let transpose = CGAffineTransform(translationX: -22, y: -42)
            let scale = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.label.transform = transpose.concatenating(scale)
            self.mainTextfield.isHidden = true
            self.mainTextfield.becomeFirstResponder()
        }
    }
    
    func startAnimationForFilledTextField() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: []) {
            let transpose = CGAffineTransform(translationX: -22, y: -42)
            let scale = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.label.transform = transpose.concatenating(scale)
            self.mainTextfield.isHidden = false
        }
    }
    
    func didStartFocus() {
        self.label.textColor = .black
        self.innerView.layer.borderColor = .init(red: 40, green: 30, blue: 20, alpha: 1)
        self.rightImageView.tintColor = .black
    }
    
    func didFinishFocus() {
        self.label.textColor = .black
        self.innerView.layer.borderColor = .init(red: 40, green: 30, blue: 20, alpha: 1)
        self.rightImageView.tintColor = .black
    }
    
    func undoAnimation() {
        let size = UIViewPropertyAnimator(duration: 0.2, curve: .linear) {
            self.didFinishFocus()
            self.mainTextfield.isHidden = true
            self.label.transform = .identity
            self.mainTextfield.resignFirstResponder()
            self.mainTextfield.endEditing(true)
        }
        
        size.startAnimation()
    }
    
    func didFinishEditing() {
        if textFieldIsEmpty {
            undoAnimation()
        } else {
            didFinishFocus()
            mainTextfield.resignFirstResponder()
            mainTextfield.endEditing(true)
        }
    }
    
    func didBeginEditing() {
        if textFieldIsEmpty {
            startAnimation()
        } else {
            didStartFocus()
        }
    }
}

//MARK: - UITextFieldDelegate
extension AppetitoTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didFinishEditing()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        didFinishEditing()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkerFunction?()
    }
}
