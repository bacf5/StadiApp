//
//  StadiumMap.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 06/07/2025.
//

import SwiftUI
import MapKit

struct StadiumMap: View {
    
    let estadios = StadiumClass()
    @State var position: MapCameraPosition
    @State var satellite = false
    
    // maybe add the name of the club who is Local in this stadium
    
    var body: some View {
        Map(position: $position) {
            ForEach(estadios.stadiums) { stadium in
                Annotation(stadium.name, coordinate: stadium.location) {
                    Image(stadium.imageClub)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 85)
                        .shadow(color: .white, radius: 3)
                }
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing) {
            Button {
                satellite.toggle()
            } label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
                    .animation(.spring, value: satellite)
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    StadiumMap(position:
            .camera(MapCamera(
                centerCoordinate: StadiumClass().stadiums[7].location,
                distance: 1000,
                heading: 180,
                pitch: 60)))
    .preferredColorScheme(.dark)
}
