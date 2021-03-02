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
}
