//
//  CharactersViewController.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

import UIKit

class CharactersViewController: UITableViewController {
    
    var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
      }
}

extension CharactersViewController {
    func fetchCharacters() {
        guard let url = URL(string: URLExamples.getCharacters.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                self.characters = try JSONDecoder().decode([Character].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
