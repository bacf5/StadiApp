//
//  ContentView.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 01/07/2025.
//

import SwiftUI

struct ContentView: View {
    let stadiumClass = StadiumClass()
    
    var body: some View {
        List(stadiumClass.stadiums) { stadium in
            HStack {
                // Stadium Image
                Image(stadium.imageStadium)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .shadow(color: .white, radius: 1)
                    
                    
                VStack(alignment: .leading) {
                    // Stadium Name
                    Text(stadium.name)
                        .fontWeight(.bold)
                    
                    // Stadium Type
                    Text(stadium.type.rawValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(stadium.type.background)
                        .clipShape(.capsule)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
