//
//  CharactersViewController.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

import UIKit
import Alamofire

class CharactersViewController: UITableViewController {
    
    var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        self.alamofireGetButtonPressed()
        
        /*NetworkManager.shared.fetchCharacters(from: URLExamples.getCharacters.rawValue) { characters in
            self.characters = characters
            self.tableView.reloadData()
    }*/
}
    // MARK: - Table view data source

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let characterCell = cell as? CharacterCell {
            characterCell.configure(with: character)
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let characterVC = segue.destination as? CharacterViewController else { return }
            characterVC.character = characters[indexPath.row]
        }
    }
}

extension CharactersViewController {
    func alamofireGetButtonPressed() {
        AF.request(URLExamples.getCharacters.rawValue)
            .validate()
            .responseJSON { responseData in
                switch responseData.result {
                case .success(let value):
                    self.characters = Character.getCharacters(from: value)

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }

                case .failure(let error):
                    print(error)
                }
            }
    }
}
