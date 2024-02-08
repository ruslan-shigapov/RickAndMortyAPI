//
//  NetworkManager.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit
import Combine

enum NetworkError: Error {
    case sessionError(Error)
    case noData
    case decodingError
    case imageNotLoaded
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let decoder = JSONDecoder()
    
    private init() {}
    
    func responsePublisher(by url: URL) -> AnyPublisher<Response, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .mapError { NetworkError.sessionError($0) }
            .tryMap {
                guard !$0.data.isEmpty else { throw NetworkError.noData }
                return $0.data
            }
            .decode(type: Response.self, decoder: decoder)
            .mapError { _ in NetworkError.decodingError }
            .eraseToAnyPublisher()
    }
    
    func imagePublisher(by url: URL) -> AnyPublisher<UIImage?, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap {
                guard let image = UIImage(data: $0.data) else {
                    throw NetworkError.noData
                }
                return image
            }
            .mapError { _ in NetworkError.imageNotLoaded }
            .eraseToAnyPublisher()
    }
}
