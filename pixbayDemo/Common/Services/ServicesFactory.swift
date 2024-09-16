//
//  ServicesFactory.swift
//  pixbayDemo
//
//  Created by Ilgiz Fazlyev on 16.09.2024.
//

final class ServicesFactory {
    
    public static var shared = ServicesFactory()
    
    lazy var imageInfoLoaderService: ImageInfoLoaderServiceProtocol = ImageInfoLoaderService(
        requestPath: Constants.API.baseURL+Constants.API.apiKeypath+Constants.API.apiKey+Constants.API.searchPath
    )
}
