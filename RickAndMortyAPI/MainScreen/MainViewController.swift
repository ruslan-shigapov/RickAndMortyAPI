//
//  MainViewController.swift
//  RickAndMortyAPI
//
//  Created by Ruslan Shigapov on 07.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    private lazy var charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setConstraints()
    }
    
    private func setupUI() {
        setupNavigationBar()
        view.addSubview(charactersTableView)
        charactersTableView.dataSource = self
        charactersTableView.delegate = self
    }
    
    private func setupNavigationBar() {
        title = "Rick and Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setConstraints() {
         NSLayoutConstraint.activate([
             charactersTableView.topAnchor.constraint(equalTo: view.topAnchor),
             charactersTableView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor),
             charactersTableView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
             charactersTableView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor)
         ])
     }
}

// MARK: - Table view data source
extension MainViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        UITableViewCell()
    }
}

// MARK: - Table view delegate
extension MainViewController: UITableViewDelegate {
    
}
