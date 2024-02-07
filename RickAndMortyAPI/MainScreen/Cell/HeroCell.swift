//
//  HeroCell.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit
import Combine

final class HeroCell: UITableViewCell {
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .secondarySystemBackground
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel = UILabel()
    private let genderLabel = UILabel()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, genderLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private var storage: Set<AnyCancellable> = []
    
    weak var viewModel: HeroCellViewModel? {
        didSet {
            nameLabel.text = viewModel?.heroName
            genderLabel.text = viewModel?.heroGender
            viewModel?.$heroPicture
                .sink { [weak self] in
                    self?.pictureImageView.image = $0
                }
                .store(in: &storage)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(pictureImageView)
        addSubview(infoStackView)
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
    }
}

// MARK: - Layout
private extension HeroCell {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            pictureImageView.widthAnchor.constraint(equalToConstant: 80),
            pictureImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 16),
            pictureImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16),
            pictureImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16),
            
            infoStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            infoStackView.leadingAnchor.constraint(
                equalTo: pictureImageView.trailingAnchor,
                constant: 16),
            infoStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16)
        ])
    }
}
