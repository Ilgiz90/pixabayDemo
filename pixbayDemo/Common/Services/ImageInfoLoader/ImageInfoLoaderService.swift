//
//  ImageInfoLoaderService.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

import Foundation
import Combine
import Alamofire

final class ImageInfoLoaderService {
    private let requestPath: String
    
    init(requestPath: String) {
        self.requestPath = requestPath
    }
}

extension ImageInfoLoaderService : ImageInfoLoaderServiceProtocol {
    func loadImagesInfo(searchString: String) -> AnyPublisher<HitResponse, ImageInfoLoaderError> {
        return AF.request(requestPath+searchString)
            .publishDecodable(type: HitResponse.self)
            .value()
            .mapError({ error -> ImageInfoLoaderError in
                ImageInfoLoaderError(description: error.localizedDescription)
            })
            .eraseToAnyPublisher()
        
    }
}

struct ImageInfoLoaderError: Error {
    let description: String
}
