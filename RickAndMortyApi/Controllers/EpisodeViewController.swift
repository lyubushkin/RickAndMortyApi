//
//  EpisodeViewController.swift
//  RickAndMortyApi
//
//  Created by Swift on 03.03.2021.
//

import UIKit

class EpisodeViewController: UITableViewController {
    
    var episodes: [Episode] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 150
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let episode = episodes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let episodeCell = cell as? EpisodeCell {
            episodeCell.configure(with: episode)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
      }
}

extension EpisodeViewController {
    func fetchEpisodes() {
        guard let url = URL(string: URLExamples.getEpisodes.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                self.episodes = try JSONDecoder().decode([Episode].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
