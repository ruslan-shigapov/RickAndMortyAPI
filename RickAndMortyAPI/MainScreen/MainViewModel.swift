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
    
    private var offset = 20
    private var nextPage: String? = nil
    
    private var link: URL {
        URL(string: nextPage ?? "https://rickandmortyapi.com/api/character")!
    }
    
    private var subscription: AnyCancellable? = nil
    
    init() {
        getHeroes()
    }
    
    func getHeroes() {
        subscription = NetworkManager.shared.responsePublisher(by: link)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] in
                self?.heroes.append(contentsOf: $0.results)
                self?.nextPage = $0.info.next
            }
    }
    
    func getExtraHeroes(afterRowAt indexPath: IndexPath) {
        if indexPath.row == (heroes.count - 1) {
            getHeroes()
        }
    }
    
    func numberOfRows() -> Int {
        heroes.count
    }
    
    func getHeroCellViewModel(at indexPath: IndexPath) -> HeroCellViewModel {
        HeroCellViewModel(hero: heroes[indexPath.row])
    }
    
    func getDetailsViewModel(at indexPath: IndexPath) -> DetailsViewModel {
        DetailsViewModel(hero: heroes[indexPath.row])
    }
}
