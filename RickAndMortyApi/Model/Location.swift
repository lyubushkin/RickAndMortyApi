//
//  Location.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

struct Location: Decodable {
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    
    init(locationData: [String: Any]) {
        name = locationData["name"] as? String
        type = locationData["type"] as? String
        dimension = locationData["dimension"] as? String
        residents = locationData["residents"] as? [String]
        url = locationData["url"] as? String
    }
}
