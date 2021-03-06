//
//  DetailEpisodeViewController.swift
//  RickAndMortyApi
//
//  Created by Swift on 06.03.2021.
//

import UIKit
import Alamofire

class DetailEpisodeViewController: UIViewController {
    
    var episode: Episode!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var episodeLabel: UILabel!
    @IBOutlet var characterLabel: UILabel!
    
    private func showEpisodeInfo() {
        nameLabel.text = episode.name
        episodeLabel.text = episode.episode
        
        guard let characters = episode.characters else { return }
        
        var finalCharacters = ""
        
        for character in characters {
            finalCharacters += "\n\(character)"
        }
        
        characterLabel.text = "Characters: \(finalCharacters)"
    }
}

extension DetailEpisodeViewController {
    func alamofireGetButtonPressed(from url: String) {
        AF.request(url)
            .validate()
            .responseJSON { responseData in
                switch responseData.result {
                case .success(let value):
                    self.episode = Episode.getEpisode(from: value)

                    DispatchQueue.main.async {
                        self.showEpisodeInfo()
                    }

                case .failure(let error):
                    print(error)
                }
            }
    }
}
