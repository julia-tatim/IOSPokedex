//
//  Pokemon.swift
//  IOSPokedex
//
//  Created by user275803 on 6/4/25.
//

import Foundation

struct Pokemon : Codable{
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    var id: String { url }
    var name: String
    var url: String
}

struct PokemonDetails: Codable {
    let sprites: PokemonSprites
    let height: Int
    let weight: Int
    let types: [TypeSlot]
}

struct PokemonSprites: Codable {
    let front_default: String?
}

struct TypeSlot: Codable {
    let type: TypeDetail
}

struct TypeDetail: Codable {
    let name: String
    let url: String
}

class PokeApi {
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            return
        }
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
    
    func getPokemonDetails(from url: String, completion: @escaping (PokemonDetails?) -> ()) {
        guard let detailURL = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: detailURL) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            do { let detail = try JSONDecoder().decode(PokemonDetails.self, from: data)
                DispatchQueue.main.async {
                    completion(detail)
                }
            } catch {
                print("Erro ao decodificar detalhes: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
