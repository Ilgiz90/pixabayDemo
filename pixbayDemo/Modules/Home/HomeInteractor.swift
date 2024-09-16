//
//  HomeInteractor.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

import Combine

final class HomeInteractor {
    private let imageInfoLoaderService: ImageInfoLoaderServiceProtocol

    init(imageInfoLoaderService: ImageInfoLoaderServiceProtocol) {
        self.imageInfoLoaderService = imageInfoLoaderService
    }
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorInterface {
    func getImages(searchString: String) -> AnyPublisher<HitResponse, ImageInfoLoaderError> {
        imageInfoLoaderService.loadImagesInfo(searchString: searchString)
    }
    
}
