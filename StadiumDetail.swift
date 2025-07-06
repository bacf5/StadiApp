//
//  StadiumDetail.swift
//  StadiApp
//
//  Created by Bruno Agustín Caruso Fassa on 05/07/2025.
//

import SwiftUI
import MapKit


struct StadiumDetail: View {
    
    let estadio: Stadium
    
    @State var position: MapCameraPosition
    
    @Namespace var namespace
    
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
                    NavigationLink {
                        StadiumMap(position:
                                .camera(MapCamera(
                                    centerCoordinate: estadio.location,
                                    distance: 1000,
                                    heading: 180,
                                    pitch: 60)
                                )
                        )
                        .navigationTransition(.zoom(sourceID: 1, in: namespace))
                        
                    } label: {
                        Map(position: $position) {
                            Annotation(
                                estadio.name,
                                coordinate: estadio.location
                            ) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.medium)
                                    .symbolEffect(.wiggle)
                            }
                        }
                        .frame(height: 150)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 8)
                        }.overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading, .bottom], 5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.top)
                        .padding(.bottom)
                        
                    }
                    .matchedTransitionSource(id: 1, in: namespace)
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
        .toolbarBackground(.automatic)
    }
}

#Preview {
    
    let stadium = StadiumClass().stadiums[2]
    
    NavigationStack {
        StadiumDetail(
            estadio: stadium,
            position:
                    .camera(
                        MapCamera(
                            centerCoordinate: stadium.location,
                            distance: 10000
                        )
                    )
        )
        .preferredColorScheme(.dark)
    }
}
