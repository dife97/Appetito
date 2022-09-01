//
//  MyReservationView.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 01/09/22.
//

import UIKit

class MyReservationView: UIView {


    private lazy var titleLabel: UILabel = {
        let informationLabel = UILabel(frame: .zero)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.numberOfLines = 0
        informationLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:30)
        informationLabel.text = "Minhas Reservas"
        informationLabel.textColor = UIColor(named: "mainYellow")
        informationLabel.textAlignment = .center

        return informationLabel
    }()

    private lazy var myReservetionLabel: UILabel = {
        let informationLabel = UILabel(frame: .zero)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.numberOfLines = 0
        informationLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:20)
        informationLabel.text = "Reservas novas: "
        informationLabel.textColor = .white


        return informationLabel
    }()

    private lazy var myReservetionTextField: UITextField = {
        let dateTextField = UITextField(frame: .zero)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor = .white
        dateTextField.layer.cornerRadius = 8
        dateTextField.placeholder = "  Local dia/mes/ano"
        dateTextField.textColor = UIColor.black

        return dateTextField
    }()

    private lazy var oldReservationlabel: UILabel = {
        let informationLabel = UILabel(frame: .zero)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.numberOfLines = 0
        informationLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:20)
        informationLabel.text = "Reservas Antigas: "
        informationLabel.textColor = .white

        return informationLabel
    }()

    private lazy var oldReservationsTextField: UITextField = {
        let dateTextField = UITextField(frame: .zero)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor = .white
        dateTextField.layer.cornerRadius = 8
        dateTextField.placeholder = "  Fogo de Chão 21/03/2022"
        dateTextField.textColor = UIColor.black

        return dateTextField
    }()
    
    private lazy var oldReservationsTwoTextField: UITextField = {
        let dateTextField = UITextField(frame: .zero)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor = .white
        dateTextField.layer.cornerRadius = 8
        dateTextField.placeholder = "  Bom Prato 21/07/2022"
        dateTextField.textColor = UIColor.black

        return dateTextField
    }()
    
    private lazy var oldReservationsThreeTextField: UITextField = {
        let dateTextField = UITextField(frame: .zero)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor = .white
        dateTextField.layer.cornerRadius = 8
        dateTextField.placeholder = "  Burguer King 01/05/2022"
        dateTextField.textColor = UIColor.black

        return dateTextField
    }()
    
    private lazy var oldReservationsFourTextField: UITextField = {
        let dateTextField = UITextField(frame: .zero)
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.backgroundColor = .white
        dateTextField.layer.cornerRadius = 8
        dateTextField.placeholder = "  Mc Donalds 11/02/2022"
        dateTextField.textColor = UIColor.black

        return dateTextField
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, myReservetionLabel, myReservetionTextField , oldReservationlabel, oldReservationsTextField, oldReservationsTwoTextField, oldReservationsThreeTextField, oldReservationsFourTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.axis = .vertical
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
}
extension MyReservationView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(myReservetionLabel)
        addSubview(myReservetionTextField)
        addSubview(oldReservationlabel)
        addSubview(oldReservationsTextField)
        addSubview(stackView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        titleLabel.heightAnchor.constraint(equalToConstant: 30),
        
        
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        stackView.heightAnchor.constraint(equalToConstant: 500),
        
        ])
    }
    
    
    
}
