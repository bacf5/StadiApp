//
//  StadiumClass.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 03/07/2025.
//

import Foundation

class StadiumClass {
    var stadiums: [Stadium] = [] // here is going all the stadiums data form the JSON
    
    init() {
        decodeStadiumData()
    }
    
    func decodeStadiumData() {
        if let url = Bundle.main.url(
            forResource: "estadiosdata",
            withExtension: "json"
        ) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                stadiums = try decoder.decode([Stadium].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func search(for searchText: String) -> [Stadium] {
        if searchText.isEmpty {
            return stadiums
        } else {
            return stadiums.filter {
                stadiums in
                stadiums.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

