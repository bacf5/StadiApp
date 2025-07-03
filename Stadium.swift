//
//  Stadium.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 03/07/2025.
//

// decoding the data with Decodable.

struct Stadium: Decodable {
    let id: Int
    let name: String
    let type: String
    let capacity: Double
    let latitude: Double
    let longitude: Double
    let matches: [String]
    let info: String
    let link: String
}
