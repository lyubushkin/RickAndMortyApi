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
    
    init(episodeData: [String: Any]) {
        name = episodeData["name"] as? String
        episode = episodeData["episode"] as? String
        characters = episodeData["characters"] as? [String]
    }
    
    static func getEpisode(from value: Any) -> Episode? {
        guard let episodeData = value as? [String: Any] else { return nil }
        return Episode(episodeData: episodeData)
    }
}
