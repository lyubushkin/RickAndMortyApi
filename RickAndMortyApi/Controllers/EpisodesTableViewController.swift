//
//  EpisodesTableViewController.swift
//  RickAndMortyApi
//
//  Created by Swift on 06.03.2021.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
    
    var episodes: [String] = []

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = episodes[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard
                let detailEpisodeilVC = segue.destination as? DetailEpisodeViewController
            else { return }
            
            detailEpisodeilVC.alamofireGetButtonPressed(from: episodes[indexPath.row])
        }
    }
}
