//
//  HomeViewController.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 13.09.2024.
//

import UIKit
import Alamofire
import Combine
final class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let imageInfoLoaderService = ServicesFactory.shared.imageInfoLoaderService
    private var subscriptions = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        HomeItemCell.register(in: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        searchBar.delegate = self
    }
    
    func loadImagesInfo(searchString: String) -> AnyPublisher<HitResponse, ImageInfoLoaderError> {
        return AF.request(Constants.API.baseURL+Constants.API.apiKeypath+Constants.API.apiKey+Constants.API.searchPath+searchString)
            .publishDecodable(type: HitResponse.self)
            .value()
            .mapError({ error -> ImageInfoLoaderError in
                ImageInfoLoaderError(description: error.localizedDescription)
            })
            .eraseToAnyPublisher()
        
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
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
        print("TAP")
        let controller = FullScreenViewController(nibName: "FullScreen", bundle: nil)
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        self.present(controller, animated: true)
    }

}

// MARK: - UISearchBarDelegate

extension HomeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        imageInfoLoaderService
            .loadImagesInfo(searchString: searchBar.text ?? "")
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { result in
                print(result)
            }
            .store(in: &subscriptions)
    }
}
