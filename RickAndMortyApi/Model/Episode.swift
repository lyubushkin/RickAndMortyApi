//
//  Episode.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

struct Episode: Decodable {
    let name: String?
    let episode: String?
    let characters: [String]?
}
