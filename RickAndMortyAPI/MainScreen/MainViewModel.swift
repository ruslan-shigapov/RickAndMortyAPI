//
//  MainViewModel.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

final class MainViewModel {
    
    private var heroes: [Hero] = []
    
    func numberOfRows() -> Int {
        heroes.count + 1 // temporary
    }
}
