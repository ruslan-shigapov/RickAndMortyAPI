//
//  CharacterCell.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit

final class CharacterCell: UITableViewCell {
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .cyan
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .cyan
        stackView.axis = .vertical
        let nameLabel = UILabel()
        nameLabel.text = "Rick"
        stackView.addArrangedSubview(nameLabel)
        let genderLabel = UILabel()
        genderLabel.text = "Male"
        stackView.addArrangedSubview(genderLabel)
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(pictureImageView)
        addSubview(infoStackView)
        setConstraints()
    }
    
    private func setConstraints() {
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
