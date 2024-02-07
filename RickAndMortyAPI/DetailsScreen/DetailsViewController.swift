//
//  DetailsViewController.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit
import Combine

final class DetailsViewController: UIViewController {
    
    private let pictureImageView = PictureImageView()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: DetailsViewModel? {
        didSet {
            nameLabel.text = viewModel?.heroName
            viewModel?.$heroPicture
                .sink { [weak self] in
                    self?.pictureImageView.image = $0
                }
                .store(in: &storage)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(pictureImageView)
        view.addSubview(nameLabel)
    }
}

// MARK: - Layout
private extension DetailsViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            pictureImageView.widthAnchor.constraint(equalToConstant: 200),
            pictureImageView.heightAnchor.constraint(equalToConstant: 200),
            pictureImageView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor),
            pictureImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(
                equalTo: pictureImageView.bottomAnchor,
                constant: 16)
        ])
    }
}
