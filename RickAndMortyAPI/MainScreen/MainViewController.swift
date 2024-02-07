//
//  MainViewController.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit
import Combine

final class MainViewController: UIViewController {
    
    private let heroesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HeroCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let viewModel = MainViewModel()
    
    private var storage: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
        bind()
    }
    
    private func setupUI() {
        setupNavigationBar()
        view.addSubview(heroesTableView)
        heroesTableView.dataSource = self
        heroesTableView.delegate = self
    }
    
    private func setupNavigationBar() {
        title = "Rick and Morty etc."
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func bind() {
        viewModel.$heroes
            .sink { [weak self] _ in
                self?.heroesTableView.reloadData()
            }
            .store(in: &storage)
    }
}

// MARK: - Table view data source
extension MainViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell") as? HeroCell
        cell?.viewModel = viewModel.getHeroCellViewModel(at: indexPath)
        return cell ?? UITableViewCell()
    }
}

// MARK: - Table view delegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        132
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsVC = DetailsViewController()
        detailsVC.viewModel = viewModel.getDetailsViewModel(at: indexPath)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

// MARK: - Layout
private extension MainViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            heroesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            heroesTableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            heroesTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)
        ])
    }
}
