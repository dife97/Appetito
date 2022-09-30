//
//  ReservationViewController.swift
//  Appetito
//
//  Created by Flavio Dobler on 2022-09-01.
//

import UIKit
import FirebaseAuth

class ReservationViewController: BaseViewController {
    
    var reservation: ReservationModel?
    
    var restauranteName: String
    var date: String = ""
    var amountOfPeople: Int = 1
    var occasion: String = ""
    var userID: String = ""
    
    init(reservation: ReservationModel? = nil) {
        self.reservation = reservation
        
        if let reservation = reservation {
            self.restauranteName = reservation.restaurant!
        } else {
            self.restauranteName = ""
        }
        
        super.init(nibName: nil, bundle: nil)
    }
    
    init(restauranteName: String) {
        self.restauranteName = restauranteName
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let reservationView: ReservationView = {
        let reservationView = ReservationView()
        
        reservationView.translatesAutoresizingMaskIntoConstraints = false
        
        return reservationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        reservationView.delegate = self
        view.backgroundColor = UIColor(named: "mainBackground")
        
        afterShowKeyboard = { height in
            self.keyboardDidApear(height: height)
        }
        
        afterHideKeyboard = {
            self.keyboardDidDisapear()

        }
    }
    
    func keyboardDidApear(height: CGFloat) {
        if reservationView.occasionTextField.isFirstResponder {
            self.view.frame.origin.y = -height
        } 
    }
    
    func keyboardDidDisapear(){
        self.view.frame.origin.y = 0
    }
    
    private func getUserID() -> String? {
        
        guard let currentUser = Auth.auth().currentUser else {
            print("[ReservationVC] Usuário não autenticado")
            
            return nil
        }
        
        return currentUser.uid
    }
    
    private func saveReservationData() {
        
        db.collection("reservations").addDocument(data: [
            "restaurant": restauranteName,
            "isActive": true,
            "date": date,
            "numberOfPeople": amountOfPeople,
            "occasion": occasion,
            "userID": userID
        ]) { error in
            
            if let error = error {
                print("[ReservationVC] [ConfirmButton] Error adding document: \(error.localizedDescription)")
            } else {
                print("[ReservationVC] [ConfirmButton] Reservation saved successfully")
                
                DispatchQueue.main.async {
                    
                    let alert = CustomAlert(controller: self)
                    
                    alert.handlerFunction = { self.dismiss(animated: true) }
                    
                    alert.exibe(
                        titulo: "Reserva registrada",
                        mensagem: "A sua reserva para \(self.restauranteName) foi registrada com sucesso para o dia \(self.date)"
                    )
                }
            }
        }
    }
}

extension ReservationViewController: ViewConfiguration {
    
    func buildViewHierarchy() {
        
        view.addSubview(reservationView)
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate([
            reservationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            reservationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            reservationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            reservationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        navigationController?.navigationItem.backButtonTitle = "Voltar"
    }
}

extension ReservationViewController: ReservationViewProtocol {
    
    func tappedConfirm() {
        
        date = reservationView.date
        
        amountOfPeople = reservationView.amountOfPeople
        
        occasion = reservationView.occasion
        
        userID = getUserID() ?? ""
        
        saveReservationData()
    }
}
