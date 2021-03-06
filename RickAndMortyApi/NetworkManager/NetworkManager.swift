//
//  NetworkManager.swift
//  RickAndMortyApi
//
//  Created by Swift on 02.03.2021.
//
import Foundation
//import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCharacters(from url: String?, with complition: @escaping ([Character]) -> Void) {
        guard let stringURL = url else { return }
        
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
               let characters = try JSONDecoder().decode([Character].self, from: data)
                
                DispatchQueue.main.async {
                    complition(characters)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
