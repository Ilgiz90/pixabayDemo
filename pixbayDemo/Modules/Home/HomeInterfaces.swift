//
//  HomeInterfaces.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

import Combine

protocol HomeWireframeInterface {
    // TODO: send images
    func navigateToFullScreen()
}

protocol HomeViewInterface: AnyObject {
    func reloadData()
}

protocol HomePresenterInterface {
    var numberOfItems: Int { get }
    func loadImages(searchString: String?)
    // TODO: send images
    func showFullScreen()
}

protocol HomeInteractorInterface {
    func getImages(searchString: String) -> AnyPublisher<HitResponse, ImageInfoLoaderError>
}
