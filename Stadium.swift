//
//  Stadium.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 03/07/2025.
//

// decoding the data with Decodable.

import SwiftUI

struct Stadium: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: StadiumType
    let capacity: Double
    let latitude: Double
    let longitude: Double
    let matches: [String]
    let info: String
    let link: String
    
    var imageStadium: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    enum StadiumType: String, Decodable {
        case Futbol
        case NFL
        
        var background: Color {
            switch self {
            case .Futbol:
                    .green
            case .NFL:
                    .brown
            }
            
        }
    }
}
