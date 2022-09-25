//
//  ExtensionRagex.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 21/09/22.
//

import Foundation

extension String {
    
    enum ValidateFieldType {
        case email, password
    }
    
    func valid(_ type: ValidateFieldType) -> Bool {
        switch type {
        case .email:
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
            
        case .password:
            let passwordRegEx = "^.{6,15}$"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
        }
    }
}
