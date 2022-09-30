//
//  User+CoreDataProperties.swift
//  Appetito
//
//  Created by Diego Rodrigues on 28/09/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phoneNumber: String?

}

extension User : Identifiable {

}
