//
//  STPhotoDetailsWorkerSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit
import STPhotoCore

class STPhotoDetailsWorkerSpy: STPhotoDetailsWorker {
    var photo: STPhoto = STPhoto(id: "photoId")
    var collection: STCollection = STCollection(id: "collectionId", name: "Collection name")
    var entities: [EntityLevel: GeoEntity] = [:]
    
    var fetchPhotoCalled: Bool = false
    var shouldFailFetchPhoto: Bool = false
    
    var fetchPhotoImageCalled: Bool = false
    var shouldFailFetchPhotoImage: Bool = false
    
    var fetchPhotoUserImageCalled: Bool = false
    var shouldFailFetchPhotoUserImage: Bool = false
    
    var fetchPhotoCollectionCalled: Bool = false
    var shouldFailFetchPhotoCollection: Bool = false
    
    var fetchPhotoLocationAddressCalled: Bool = false
    var shouldFailFetchPhotoLocationAddress: Bool = false
    
    var fetchPhotoLocationEntitiesCalled: Bool = false
    var shouldFailFetchPhotoLocationEntities: Bool = false
    
    override func fetchPhoto(photoId: String) {
        self.fetchPhotoCalled = true
        
        if self.shouldFailFetchPhoto {
            self.delegate?.failureDidFetchPhoto(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchPhoto(photo: self.photo)
        }
    }
    
    override func fetchPhotoImage(url: String?) {
        self.fetchPhotoImageCalled = true
        
        if self.shouldFailFetchPhotoImage {
            self.delegate?.failureDidFetchPhotoImage(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchPhotoImage(image: UIImage())
        }
    }
    
    override func fetchPhotoUserImage(url: String?) {
        self.fetchPhotoUserImageCalled = true
        
        if self.shouldFailFetchPhotoUserImage {
            self.delegate?.failureDidFetchPhotoUserImage(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchPhotoUserImage(image: UIImage())
        }
    }
    
    override func fetchPhotoCollection(id: String) {
        self.fetchPhotoCollectionCalled = true
        
        if self.shouldFailFetchPhotoCollection {
            self.delegate?.failureDidFetchPhotoCollection(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchPhotoCollection(collection: self.collection)
        }
    }
    
    override func fetchPhotoLocationAddress(location: STLocation) {
        self.fetchPhotoLocationAddressCalled = true
        
        if self.shouldFailFetchPhotoLocationAddress {
            self.delegate?.failureDidFetchLocationAddress(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchLocationAddress(address: STAddress())
        }
    }
    
    override func fetchPhotoLocationEntities(location: STLocation) {
        self.fetchPhotoLocationEntitiesCalled = true
        
        if self.shouldFailFetchPhotoLocationEntities {
            self.delegate?.failureDidFetchPhotoLocationEntities(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchPhotoLocationEntities(entities: self.entities)
        }
    }
}
