//
//  CustomCollectionViewCell.swift
//  Appetito
//
//  Created by Flavio Dobler on 2022-08-30.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 200
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var cellBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var cellLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(imageView)
        contentView.addSubview(cellBackground)
        contentView.addSubview(cellLabel)
        
        
        NSLayoutConstraint.activate([
        
            cellBackground.topAnchor.constraint(equalTo: )
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
