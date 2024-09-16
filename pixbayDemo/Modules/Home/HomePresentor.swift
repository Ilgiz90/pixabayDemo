//
//  HomePresentor.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

import Combine
import Foundation
import UIKit
final class HomePresenter {

    // MARK: - Private properties -

    private unowned let view: HomeViewInterface
    private let interactor: HomeInteractorInterface
    private let wireframe: HomeWireframeInterface
    private var subscriptions = Set<AnyCancellable>()
    
    private var items: [Hit]?

    // MARK: - Lifecycle -

    init(
        view: HomeViewInterface,
        interactor: HomeInteractorInterface,
        wireframe: HomeWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension HomePresenter: HomePresenterInterface {
    var numberOfItems: Int {
        items?.count ?? 0
    }
    
    func loadImages(searchString: String?) {
        guard let searchString = searchString else {
            return
        }
        
        interactor.getImages(searchString: searchString)
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: {[weak self] result in
                self?.items = result.hits
                self?.view.reloadData()
            }
            .store(in: &subscriptions)
    }
    
    func showFullScreen() {
        wireframe.navigateToFullScreen()
    }
    


}
