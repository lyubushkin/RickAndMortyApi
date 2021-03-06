//
//  CharacterViewController.swift
//  RickAndMortyApi
//
//  Created by Swift on 06.03.2021.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterInfoLabel: UILabel!
    
    var character: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        showInfoAboutCharacter()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeVC = segue.destination as? EpisodesTableViewController else { return }
        episodeVC.episodes = character.episode ?? []
    }
    
    private func showInfoAboutCharacter() {

        characterInfoLabel.text =
"""
Name: \(character.name ?? "NoName")
Status: \(character.status ?? "NoStatus")
Species: \(character.species ?? "NoSpecies")
Gender: \(character.name ?? "NoGender")
Location: \(character.location?.name ?? "NoName location")
\(character.location?.dimension ?? "")
"""
        guard let stringURL = character.image else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        DispatchQueue.main.async {
            self.characterImage.image = UIImage(data: imageData)
        }

    }
}

