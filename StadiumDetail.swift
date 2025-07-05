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
                
                    // Club IMG
                    Image(estadio.imageClub)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/2.5, height: geo.size.height/4)
                        .shadow(color: .black, radius: 8)
                        .offset(y: 55)
                        .offset(x: -30)
                        
                
                
                    // Somewehere put the stadium capacity
                }
            
                // Stadium name
            
                // Stadium location
            
                // Stadium info
            
                // Stadium host's matches
            
                // Stadium link
            
            
            
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    StadiumDetail(estadio: StadiumClass().allStadiums[2])
    //        .preferredColorScheme(.dark)
}
