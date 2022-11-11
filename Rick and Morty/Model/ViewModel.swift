//
//  ViewModel.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 11.11.2022.
//

import Foundation

//MARK: - ViewModel

struct ViewModel {
    
    // MARK: Properties
    
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String
    let image: String
    
    // MARK: Initialization
    
    init(from results: [Result], index: IndexPath) {
        self.name = results[index.row].name
        self.status = results[index.row].status
        self.gender = results[index.row].gender
        self.image = results[index.row].image
        self.species = results[index.row].species
        self.origin = results[index.row].origin.name
    }
}
