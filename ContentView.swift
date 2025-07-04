//
//  ContentView.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 01/07/2025.
//

import SwiftUI

struct ContentView: View {
    let stadiumClass = StadiumClass()
    
    @State var searchText = ""
    @State var alphabetical = false
    
    var filteredStadiums: [Stadium] {
        stadiumClass.sort(by: alphabetical)
        return stadiumClass.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredStadiums) { stadium in
                NavigationLink {
                    Image(stadium.imageStadium)
                        .resizable()
                        .scaledToFit()
                } label: {
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
            }
            .navigationTitle("Club WC Stadiums")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
                        
                        // With if statement
                        
//                        if alphabetical {
//                            Image(systemName: "person.3")
//                        } else {
//                            Image(systemName: "textformat")
//                        }
                        // with ternary operator
                        Image(systemName: alphabetical ? "person.3" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

