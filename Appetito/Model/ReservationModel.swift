//
//  ReservationModel.swift
//  Appetito
//
//  Created by Diego Rodrigues on 30/09/22.
//

import FirebaseFirestore
import Firebase

struct ReservationModel {
    
    var restaurant: String?
    var data: String?
    var isActive: Bool
    var numberOfPeople: Int
    var occasion: String?
    var userID: String?
    var documentID: String?
    
    init(snapshot: QueryDocumentSnapshot) {
        documentID = snapshot.documentID
        
        let snapshotValue = snapshot.data()
        
        restaurant = snapshotValue["restaurant"] as? String
        data = snapshotValue["date"] as? String
        isActive = (snapshotValue["isActive"] as? Bool)!
        numberOfPeople = (snapshotValue["numberOfPeople"] as? Int)!
        occasion = snapshotValue["occasion"] as? String
        userID = snapshotValue["userID"] as? String
    }
}
