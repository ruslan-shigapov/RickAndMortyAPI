//
//  Heroes.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

struct Heroes: Decodable {
    let results: [Hero]
}

struct Hero: Decodable {
    let name: String
    let gender: String
    let image: String
}
