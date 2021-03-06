//
//  Character.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

struct Character: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let location: Location?
    let image: String?
    let episode: [String]?
    
    init(characterData: [String: Any]) {
        name = characterData["name"] as? String
        status = characterData["status"] as? String
        species = characterData["species"] as? String
        gender = characterData["gender"] as? String
        
        if let locationAny = characterData["location"] as? [String: Any] {
            location = Location(locationData: locationAny)
        } else {
            location = nil
        }
        
        image = characterData["image"] as? String
        episode = characterData["episode"] as? [String]
    }
    
    static func getCharacters(from value: Any) -> [Character] {
        guard let charactersData = value as? [[String: Any]] else { return [] }
        return charactersData.compactMap { Character(characterData: $0) }
    }
}
