//
//  Response.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

struct Response: Decodable {
    let info: Info
    let results: [Hero]
}

struct Info: Decodable {
    let next: String?
}

struct Hero: Decodable {
    let name: String
    let gender: String
    let image: String
    let status: String
    let species: String
    let origin: Place
}

struct Place: Decodable {
    let name: String
}
