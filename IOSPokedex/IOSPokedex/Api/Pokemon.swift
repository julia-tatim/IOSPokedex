// Pagination-enabled API and ViewModel

import Foundation

// MARK: - Models

struct PokemonResults: Codable {
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

// MARK: - API Service

class Pokemon {
    /// Fetch list of Pokémon with pagination
    func getData(offset: Int, limit: Int, completion: @escaping ([PokemonEntry]) -> ()) {
        let urlString = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode(PokemonResults.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded.results)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }

    /// Fetch details for a single Pokémon
    func getPokemonDetails(from url: String, completion: @escaping (PokemonDetails?) -> ()) {
        guard let detailURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: detailURL) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let detail = try JSONDecoder().decode(PokemonDetails.self, from: data)
                DispatchQueue.main.async {
                    completion(detail)
                }
            } catch {
                print("Detail decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}

// MARK: - ViewModel

