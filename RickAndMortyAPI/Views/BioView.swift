//
//  BioView.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit

final class BioView: UIView {
    
    // MARK: UI Elements
    private let genderLabel = UILabel()
    private let statusLabel = UILabel()
    private let speciesLabel = UILabel()
    private let originLabel = UILabel()
    
    private lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            genderLabel,
            statusLabel,
            speciesLabel,
            originLabel
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    private func setupUI() {
        addSubview(detailsStackView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Public Methods
    func configure(
        withGender gender: String?,
        status: String?,
        species: String?,
        origin: String?
    ) {
        genderLabel.text = "Gender: \(gender ?? "")"
        statusLabel.text = "Status: \(status ?? "")"
        speciesLabel.text = "Species: \(species ?? "")"
        originLabel.text = "Origin: \(origin ?? "")"
    }
}

// MARK: - Layout
private extension BioView {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: topAnchor),
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
