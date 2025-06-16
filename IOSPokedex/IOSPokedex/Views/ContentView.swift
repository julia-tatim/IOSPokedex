//
//  ContentView.swift
//  IOSPokedex
//
//  Created by user275803 on 6/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemon: [PokemonEntry] = []
    @State private var sprites: [String: String] = [:]
    @State var searchText = ""

    let api = Pokemon()
    var body: some View {
        NavigationView {
            List {
                
            }.onAppear {
                Pokemon().getData(offset: 0, limit: 151) { pokemon in

                    self.pokemon = pokemon
                    for pokemon in pokemon {
                        print(pokemon.name)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("")
        }
    }
}
