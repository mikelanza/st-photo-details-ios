//
//  ServiceConfigurator.swift
//  STPhotoDetails-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation

class ServiceConfigurator {
    static let shared = ServiceConfigurator()
    
    private init() { }
    
    func photoCommentsService() -> PhotoCommentsServiceProtocol {
        return PhotoCommentsNetworkService()
    }
    
    func photoService() -> PhotoServiceProtocol {
        return PhotoNetworkService()
    }
    
    func imageService() -> ImageServiceProtocol {
        return ImageNetworkService()
    }
    
    func photoCollectionService() -> PhotoCollectionServiceProtocol {
        return PhotoCollectionNetworkService()
    }
    
    func locationAddressService() -> LocationAddressServiceProtocol {
        return LocationAddressNetworkService()
    }
    
    func locationEntitiesService() -> LocationEntitiesServiceProtocol {
        return LocationEntitiesNetworkService()
    }
}
