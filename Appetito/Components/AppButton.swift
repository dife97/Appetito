//
//  AppButton.swift
//  Appetito
//
//  Created by Diego Rodrigues on 26/08/22.
//

import UIKit

class AppButton: UIView {
    
    //MARK: - Properties
    var text: String
    var bgColor: UIColor
    var leftImageName: String?
    
    //MARK: - UI
    lazy var mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.backgroundColor = bgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(text, for: .normal)
        return button
    }()
    
    lazy var leftImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.image = UIImage(named: leftImageName ?? "")
        return imageview
    }()
    
    //MARK: - Initializer
    init(text: String, background: UIColor = UIColor(named: "mainYellow")!, leftImageName: String? = nil) {
        self.text = text
        self.bgColor = background
        self.leftImageName = leftImageName
        super.init(frame: .zero)
        
        buildViewHierarchy()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 60)
    }
    
    //MARK: - View Configuration
    func buildViewHierarchy() {
        addSubview(mainButton)
        addSubview(leftImageView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            mainButton.topAnchor.constraint(equalTo: topAnchor),
            mainButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leftImageView.heightAnchor.constraint(equalToConstant: 30),
            leftImageView.widthAnchor.constraint(equalToConstant: 30),
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
