//
//  RestaurantModel.swift
//  Appetito
//
//  Created by Gustavo Fernandes on 20/09/22.
//

import Foundation

struct Restaurant: Codable {
    var id: Int
    var category: String
    var imagemRestaurant: String
    var nameRestaurant: String
    var imageNote: String
    var note: String
    var imageRestaurantInfos: String
    var infos: String
}
