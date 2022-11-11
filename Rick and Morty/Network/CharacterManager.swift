//
//  CharacterManager.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import Foundation


//MARK: - CharacterManager

final class CharacterManager {
    
    // MARK: getMainCharacter
    
    static func getMainCharacter(completion: @escaping (CharacterData) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let responseObject = try JSONDecoder().decode(CharacterData.self, from: data)
                completion(responseObject)
            } catch let error as NSError {
                print(error.userInfo)
            }
        }
        task.resume()
    }
    
    //MARK: getCharacterFromPage
    
    static func getCharacterFrom(page: Int, completion: @escaping (CharacterData) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
        
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let responseObject = try JSONDecoder().decode(CharacterData.self, from: data)
                completion(responseObject)
            } catch let error as NSError {
                print(error.userInfo)
            }
        }
        task.resume()
    }
}

