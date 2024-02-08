//
//  DetailsViewModel.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import Foundation

final class DetailsViewModel: HeroCellViewModel {
    
    var heroStatus: String {
        hero.status
    }
    
    var heroSpecies: String {
        hero.species
    }
    
    var heroOrigin: String {
        hero.origin.name
    }
    
    private let hero: Hero
    
    required init(hero: Hero) {
        self.hero = hero
        super.init(hero: hero)
    }
}
