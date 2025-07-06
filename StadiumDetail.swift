//
//  StadiumDetail.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 05/07/2025.
//

import SwiftUI

struct StadiumDetail: View {
    
    let estadio: Stadium
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // BG img (Stadium
                    Image(estadio.imageStadium)
                        .resizable()
                        .scaledToFit()
                        .overlay{
                            LinearGradient(
                                stops: [
                                    Gradient.Stop(
                                        color: .clear,
                                        location: 0.8
                                    ),
                                    Gradient.Stop(color: .black, location: 1)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        }
                    
                    // Club IMG
                    Image(estadio.imageClub)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: geo.size.width/2.5,
                            height: geo.size.height/4
                        )
                        .shadow(color: .black, radius: 8)
                        .offset(y: 55)
                        .offset(x: -30)
                    
                    
                    
                    // Somewehere put the stadium capacity
                }
                VStack(alignment: .leading) {
                    // Stadium name
                    Text(estadio.name)
                        .font(.largeTitle)
                        
                    // Stadium location
                    
                    // Stadium info
                    Text(estadio.info)
                    
                    // Stadium host's matches
                    Text("Matches played in the Club World Cup:")
                        .padding(.top)
                    
                    ForEach(estadio.matches, id: \.self) {
                        estadio in Text("‣ " + estadio)
                            .padding(.bottom, 5)
                    }
                    
                    // Stadium link
                    Text("Read more:")
                        .padding(.top)
                    
                    Link(estadio.link, destination: URL(string: estadio.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                    
                }
                .padding()
                .frame(width: geo.size.width, alignment: .leading)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StadiumDetail(estadio: StadiumClass().allStadiums[5])
        .preferredColorScheme(.dark)
}
