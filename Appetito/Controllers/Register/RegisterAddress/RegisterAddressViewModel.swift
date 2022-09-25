//
//  RegisterAddressViewModel.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import Foundation

struct RegisterAddressViewModel {
    
    var cep: CEPModel?
    
    
    func getAddress(with cep: String, onComplete: @escaping (Result<CEPModel?, Error>) -> Void) {
        
    }
}
