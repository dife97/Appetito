//
//  MyReservationViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 01/09/22.
//

import UIKit

class MyReservationViewController:  UIViewController {

    
    private let myReservationView: MyReservationView = {
        let reservationView = MyReservationView()
        reservationView.translatesAutoresizingMaskIntoConstraints = false
        
        return reservationView
    }()
    
    private lazy var titleLabel: UILabel = {
        let informationLabel = UILabel(frame: .zero)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.numberOfLines = 0
        informationLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:30)
        informationLabel.text = "Minhas Reservas"
        informationLabel.textColor = UIColor(named: "mainYellow")
        informationLabel.textAlignment = .left

        return informationLabel
    }()
    
    private lazy var restaurantLabel: UILabel = {
        let informationLabel = UILabel(frame: .zero)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.numberOfLines = 0
        informationLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        informationLabel.text = "RESTAURANTES"
        informationLabel.textColor = UIColor(named: "mainYellow")
        informationLabel.textAlignment = .left

        return informationLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let informationLabel = UILabel(frame: .zero)
        informationLabel.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.numberOfLines = 0
        informationLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:15)
        informationLabel.text = "DATAS"
        informationLabel.textColor = UIColor(named: "mainYellow")
        informationLabel.textAlignment = .left

        return informationLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [restaurantLabel, dateLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0

        return stack
    }()
    
    
    lazy var reservationTableView : UITableView = {
        let reservationTableViewController = UITableView()
        reservationTableViewController.translatesAutoresizingMaskIntoConstraints = false
        reservationTableViewController.register(MyReservationTableViewCell.self, forCellReuseIdentifier: "MyReservationTableViewCell")
        reservationTableViewController.dataSource = self
        reservationTableViewController.delegate = self
        reservationTableViewController.backgroundColor = UIColor(named: "mainBackground")
        
        return reservationTableViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = UIColor(named: "mainBackground")
    }
    @objc func didTapDismiss() {
        dismiss(animated: true)
    }
    
}

extension MyReservationViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(myReservationView)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(reservationTableView)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
                myReservationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                myReservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                myReservationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                myReservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                
                titleLabel.topAnchor.constraint(equalTo: myReservationView.topAnchor, constant: 65),
                titleLabel.leadingAnchor.constraint(equalTo: myReservationView.leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: myReservationView.trailingAnchor, constant: -16),
                titleLabel.heightAnchor.constraint(equalToConstant: 40),
                
                stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                stackView.leadingAnchor.constraint(equalTo: myReservationView.leadingAnchor, constant: 46),
                stackView.trailingAnchor.constraint(equalTo: myReservationView.trailingAnchor, constant: 46),
                stackView.bottomAnchor.constraint(equalTo: reservationTableView.topAnchor, constant: -8),
                stackView.heightAnchor.constraint(equalToConstant: 20),
                
                
                reservationTableView.topAnchor.constraint(equalTo: myReservationView.topAnchor, constant: 170),
                reservationTableView.leadingAnchor.constraint(equalTo: myReservationView.leadingAnchor, constant: 10),
                reservationTableView.trailingAnchor.constraint(equalTo: myReservationView.trailingAnchor, constant: -10),
                reservationTableView.bottomAnchor.constraint(equalTo: myReservationView.bottomAnchor, constant: 0)
                
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        
    }
}

extension MyReservationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyReservationTableViewCell", for: indexPath) as? MyReservationTableViewCell else  {
           fatalError("error to create ViagemTableViewCell")
        }
        
        return cell

    }
}

extension MyReservationViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //colocar funcao pra deletar "reserva"
        }
    }
}
