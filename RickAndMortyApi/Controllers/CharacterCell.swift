//
//  CourseCell.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterStatusLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    
    func configure(with character: Character) {
        
        DispatchQueue.global().async {
            guard let stringURL = character.image else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
        
        characterNameLabel.text = "Name: \(character.name ?? "unknown")"
        characterStatusLabel.text = "Status: \(character.status ?? "unknown")"
        genderLabel.text = "Gender: \(character.gender ?? "unknown")"
    }
}
