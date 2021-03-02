//
//  LocationViewController.swift
//  RickAndMortyApi
//
//  Created by Swift on 03.03.2021.
//

import UIKit

class LocationViewController: UITableViewController {
    
    var locations: [Location] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let location = locations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let locationCell = cell as? LocationViewCell {
            locationCell.configure(with: location)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
      }
}

extension LocationViewController {
    func fetchLocations() {
        guard let url = URL(string: URLExamples.getLocations.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                self.locations = try JSONDecoder().decode([Location].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
