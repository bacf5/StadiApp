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
}

enum StadiumType: String, Decodable, CaseIterable, Identifiable {
    case All
    case Futbol
    case NFL
    
    var id: StadiumType {
        self
    }
    
    var background: Color {
        switch self {
        case .Futbol:
                .green
        case .NFL:
                .brown
        case .All:
                .black
        }
        
    }
    
    var icon: String {
        switch self {
        case .All:
            "square.stack.3d.up.fill"
        case .Futbol:
            "soccerball"
        case .NFL:
            "american.football.fill"
        }
    }
}
