//
//  HomeWireframe.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

import UIKit

final class HomeWireframe {

    // MARK: - Public property -
    public let viewController: HomeViewController
    // MARK: - Module setup -

    init() {
        let interactor = HomeInteractor(imageInfoLoaderService: ServicesFactory.shared.imageInfoLoaderService)
        viewController = HomeViewController(nibName: "Home", bundle: nil)
        let view = viewController as HomeViewInterface
        let presenter = HomePresenter(view: view, interactor: interactor, wireframe: self)
        viewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeInterface {
    func navigateToFullScreen() {
        let controller = FullScreenViewController(nibName: "FullScreen", bundle: nil)
        controller.modalPresentationStyle = .overFullScreen
        controller.modalTransitionStyle = .crossDissolve
        viewController.present(controller, animated: true)
    }
    
}
