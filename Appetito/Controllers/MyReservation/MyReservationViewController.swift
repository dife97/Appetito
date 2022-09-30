//
//  MyReservationViewController.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 01/09/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MyReservationViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    var reservations: [ReservationModel] = []
    
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
        let tableview = UITableView()
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = UIColor(named: "mainBackground")
        
        return tableview
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "Você ainda não possui reservas."
        label.textColor = UIColor(named: "mainYellow")
        label.textAlignment = .left
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkForReservations()
    }
    
    private func checkForReservations() {
        
        guard let user = Auth.auth().currentUser?.uid else { return }
        
        let documents = db.collection("reservations").whereField("userID", isEqualTo: user)
        
        documents.getDocuments() { [weak self] querySnapshot, error in
            
            guard let self = self else { return }
            
            guard let documents = querySnapshot?.documents else { return }
            
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
                
                //TODO: alert
            } else {
                
                if documents.isEmpty {
                    
                    self.configureEmptyLabel()
                }
                
                for document in documents {
                    let reservation = ReservationModel(snapshot: document)
                    
                    if reservation.isActive == true {
                        self.reservations.append(reservation)
                    }
                }
                
                self.didGetReservations()
            }
        }
    }
    
    private func didGetReservations() {
        
        DispatchQueue.main.async {
            
            self.configureTableView()
        }
    }
    
    private func configureEmptyLabel() {
        
        DispatchQueue.main.async {
            
            self.view.addSubview(self.emptyLabel)
            
            NSLayoutConstraint.activate([
                self.emptyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.emptyLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ])
        }
    }
    
    private func configureTableView() {
        
        reservationTableView.register(MyReservationTableViewCell.self, forCellReuseIdentifier: "MyReservationTableViewCell")
        reservationTableView.dataSource = self
        reservationTableView.delegate = self
        
        view.addSubview(reservationTableView)
        
        NSLayoutConstraint.activate([
            reservationTableView.topAnchor.constraint(equalTo: myReservationView.topAnchor, constant: 170),
            reservationTableView.leadingAnchor.constraint(equalTo: myReservationView.leadingAnchor, constant: 10),
            reservationTableView.trailingAnchor.constraint(equalTo: myReservationView.trailingAnchor, constant: -10),
            reservationTableView.bottomAnchor.constraint(equalTo: myReservationView.bottomAnchor, constant: 0)
        ])
    }
    
    @objc func didTapDismiss() {
        
        dismiss(animated: true)
    }
    
    private func delete(reservation: ReservationModel) {
        
        guard let documentID = reservation.documentID else { return }
        
        db.collection("reservations").document(documentID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}

extension MyReservationViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        view.addSubview(myReservationView)
        view.addSubview(titleLabel)
        view.addSubview(stackView)
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
            stackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        view.backgroundColor = UIColor(named: "mainBackground")
    }
}

extension MyReservationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyReservationTableViewCell", for: indexPath) as? MyReservationTableViewCell else  {
            fatalError("error to create ViagemTableViewCell")
        }
        
        let reservation = reservations[indexPath.row]
        
        cell.configure(with: reservation)
        
        return cell
    }
}

extension MyReservationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let reservation = reservations[indexPath.row]

        let reservationViewController = ReservationViewController(restauranteName: reservation.restaurant!)
        
        let backItem = UIBarButtonItem()
        backItem.title = "Voltar"
        navigationItem.backBarButtonItem = backItem

        present(reservationViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let reservation = reservations[indexPath.row]
            
            delete(reservation: reservation)
            
            reservations.remove(at: indexPath.row)
            
            reservationTableView.reloadData()
        }
    }
    
    
}
