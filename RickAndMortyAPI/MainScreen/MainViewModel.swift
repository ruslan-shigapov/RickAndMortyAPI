//
//  MainViewModel.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import Foundation
import Combine

final class MainViewModel {
    
    @Published var heroes: [Hero] = []
    
    private var subscription: AnyCancellable? = nil
    
    init() {
        subscription = NetworkManager.shared.heroesPublisher()
            .replaceError(with: [])
            .assign(to: \.heroes, on: self)
    }
    
    func numberOfRows() -> Int {
        heroes.count
    }
    
    func getHeroCellViewModel(at indexPath: IndexPath) -> HeroCellViewModel {
        HeroCellViewModel(hero: heroes[indexPath.row])
    }
}
