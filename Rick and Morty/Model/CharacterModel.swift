//
//  CharacterModel.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import Foundation

// MARK: - CharacterData
struct CharacterData: Codable {
    let info            : Info
    let results         : [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next        : String?
    let prev        : String?
}

// MARK: - Result
struct Result: Codable {
    let name    : String
    let status  : Status
    let species : String
    let type    : String
    let gender  : String
    let origin  : Location
    let image   : String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url : String
}

enum Status: String, Codable {
    case alive      = "Alive"
    case dead       = "Dead"
    case unknown    = "unknown"
}

