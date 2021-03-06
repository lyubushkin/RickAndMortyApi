//
//  MainViewController.swift
//  RickAndMortyApi
//
//  Created by Lyubushkin on 02.03.2021.
//

import UIKit

class MainViewController: UICollectionViewController {
    let userActions = UserActions.allCases

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let actionCell = cell as? UserActionCell {
            let userAction = userActions[indexPath.item]
            actionCell.userActionLabel.text = userAction.rawValue
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .getCharacters: performSegue(withIdentifier: "getCharacters", sender: nil)
        case .getLocation:   performSegue(withIdentifier: "getLocations", sender: nil)
        case .getEpisodes: performSegue(withIdentifier: "getEpisodes", sender: nil)
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "getCharacters" {
            guard let charactersVC = segue.destination as? CharactersViewController else { return }
           // charactersVC.characters = charactersToVC
        }
        if segue.identifier == "getLocations" {
            guard let locationsVC = segue.destination as? LocationViewController else { return }
            locationsVC.fetchLocations()
        }
        if segue.identifier == "getEpisodes" {
            guard let episodeVC = segue.destination as? EpisodeViewController else { return }
            episodeVC.fetchEpisodes()
        }
    }
}

    // MARK: Settings size of collectionCell
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
