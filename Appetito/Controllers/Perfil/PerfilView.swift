

//
//  PerfilView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 07/09/22.
//


import UIKit

class PerfilView: UIView {
    
    lazy var perfilImage: UIImageView = {
        let perfilImage = UIImageView()
        perfilImage.translatesAutoresizingMaskIntoConstraints = false
        perfilImage.layer.borderWidth = 2
        perfilImage.layer.borderColor = UIColor.black.cgColor
        perfilImage.image = UIImage(named: "fogoDeChaoImage")
        perfilImage.layer.masksToBounds = false
        perfilImage.clipsToBounds = true
        perfilImage.layer.cornerRadius = 50
        
        return perfilImage
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:20)
        nameLabel.text = "Reservas novas: "
        nameLabel.textColor = .white
        
        return nameLabel
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .cyan
        
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PerfilView: ViewConfiguration{
    func buildViewHierarchy() {
        addSubview(scrollView)
        contentView.addSubview(stackView)
        contentView.addSubview(perfilImage)
        contentView.addSubview(nameLabel)
        
        for _ in 0..<10 {
            let view = UIView()
            view.backgroundColor = .blue
            stackView.addArrangedSubview(view)
        }
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            
            
            
        ])
    }
    
}
