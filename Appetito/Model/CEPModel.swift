//
//  CEPModel.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import Foundation

struct CEPModel: Codable {
    
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let uf: String
}
