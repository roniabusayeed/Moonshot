//
//  ContentView.swift
//  Moonshot
//
//  Created by Abu Sayeed Roni on 2023-08-26.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let layout = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail View")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackGround)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.lightBackGround)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)    // so that the title is white.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
