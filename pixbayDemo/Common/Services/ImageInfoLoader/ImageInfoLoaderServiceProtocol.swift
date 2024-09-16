//
//  ImageInfoLoaderServiceProtocol.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

import Combine

protocol ImageInfoLoaderServiceProtocol {
    func loadImagesInfo(searchString: String) -> AnyPublisher<HitResponse, ImageInfoLoaderError>
}
