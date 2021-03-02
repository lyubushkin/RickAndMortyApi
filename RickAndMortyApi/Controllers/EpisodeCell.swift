//
//  EpisodeCell.swift
//  RickAndMortyApi
//
//  Created by Swift on 03.03.2021.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet var episodeName: UILabel!
    @IBOutlet var episodeShortName: UILabel!
    @IBOutlet var episodeCharacters: UILabel!
    
    func configure(with episode: Episode) {
        
        episodeName.text = "Name: \(episode.name ?? "unknown")"
        episodeShortName.text = "Episode: \(episode.episode ?? "unknown")"
        
        guard let characters = episode.characters else { return }
        
        var finalCharacters = ""
        
        for character in characters {
            finalCharacters += "\n\(character)"
        }
        
        episodeCharacters.text = "Characters: \(finalCharacters)"
    }
}
