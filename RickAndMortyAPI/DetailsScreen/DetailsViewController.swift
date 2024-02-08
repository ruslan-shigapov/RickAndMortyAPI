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
        label.textColor = .white
        return label
    }()
    
    private let bioView = BioView()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: DetailsViewModel? {
        didSet {
            nameLabel.text = viewModel?.heroName
            bioView.configure(
                withGender: viewModel?.heroGender,
                status: viewModel?.heroStatus,
                species: viewModel?.heroSpecies,
                origin: viewModel?.heroOrigin)
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
        setupBackBarButton()
        view.backgroundColor = UIColor(named: "WeirdBlue")
        view.addSubview(pictureImageView)
        view.addSubview(nameLabel)
        view.addSubview(bioView)
    }
    
    private func setupBackBarButton() {
        let backBarButton = UIBarButtonItem()
        backBarButton.title = "Back"
        backBarButton.tintColor = .white
        let navigationBar = navigationController?.navigationBar
        navigationBar?.topItem?.backBarButtonItem = backBarButton
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
                constant: 16),
            
            bioView.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: 16),
            bioView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 32),
            bioView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -32)
        ])
    }
}
