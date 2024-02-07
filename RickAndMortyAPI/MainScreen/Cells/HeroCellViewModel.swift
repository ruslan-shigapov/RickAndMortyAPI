//
//  HeroCellViewModel.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit
import Combine

class HeroCellViewModel {
    
    var heroName: String {
        hero.name
    }
    
    var heroGender: String {
        hero.gender
    }
    
    @Published var heroPicture: UIImage?
    
    private var imageURL: URL {
        URL(string: hero.image)!
    }
    
    private var subscription: AnyCancellable? = nil
    
    private let hero: Hero
    
    required init(hero: Hero) {
        self.hero = hero
        
        subscription = NetworkManager.shared.imagePublisher(by: imageURL)
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.heroPicture, on: self)
    }
}
