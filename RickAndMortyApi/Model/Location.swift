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
}
