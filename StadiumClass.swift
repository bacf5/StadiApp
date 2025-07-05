//
//  StadiumClass.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 03/07/2025.
//

import Foundation

class StadiumClass {
    var allStadiums : [Stadium] = []
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
                allStadiums = try decoder.decode([Stadium].self, from: data)
                stadiums = allStadiums
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
    
    func sort(by alphabetical: Bool) {
        stadiums.sort {stadium1, stadium2 in
            if alphabetical {
                stadium1.name < stadium2.name
            } else {
                stadium1.capacity > stadium2.capacity
            }
        }
    }
    
    func filter(by type: StadiumType) {
        if type == .All {
            stadiums = allStadiums
        } else {
            stadiums = allStadiums.filter { stadium in
                stadium.type == type
            }
        }
    }
}

