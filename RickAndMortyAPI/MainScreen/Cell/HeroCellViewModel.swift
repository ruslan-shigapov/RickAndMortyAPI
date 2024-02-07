//
//  HeroCellViewModel.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

final class HeroCellViewModel {
    
    var heroName: String {
        hero.name
    }
    
    var heroGender: String {
        hero.gender
    }
    
    private let hero: Hero
    
    required init(hero: Hero) {
        self.hero = hero
    }
}
