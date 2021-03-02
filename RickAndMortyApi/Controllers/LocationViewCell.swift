//
//  LocationViewCell.swift
//  RickAndMortyApi
//
//  Created by Swift on 03.03.2021.
//

import UIKit

class LocationViewCell: UITableViewCell {

    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var locationTypeLabel: UILabel!
    @IBOutlet var locationDimensionLabel: UILabel!
    @IBOutlet var locationURL: UILabel!
    
    func configure(with location: Location) {
        
        locationNameLabel.text = "Name: \(location.name ?? "unknown")"
        locationTypeLabel.text = "Type: \(location.type ?? "unknown")"
        locationDimensionLabel.text = "Dimension: \(location.dimension ?? "unknown")"
        locationURL.text = "URL: \(location.url ?? "unknown")"
    }
}
