//
//  HomeViewController.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 13.09.2024.
//

import UIKit
import Alamofire
import Combine
final class HomeViewController: UIViewController  {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenterInterface!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        HomeItemCell.register(in: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemCell.cellIdentifier, for: indexPath) as? HomeItemCell
        else { fatalError()}
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showFullScreen()
    }

}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        presenter.loadImages(searchString: searchBar.text)
    }
}

extension HomeViewController: HomeViewInterface {
    func reloadData() {
        tableView.reloadData()
    }
}
