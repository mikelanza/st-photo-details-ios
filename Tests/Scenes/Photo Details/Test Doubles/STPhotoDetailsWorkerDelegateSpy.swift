//
//  STPhotoDetailsWorkerDelegateSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit
import STPhotoCore

class STPhotoDetailsWorkerDelegateSpy: STPhotoDetailsWorkerDelegate {
    var successDidFetchPhotoCalled: Bool = false
    var failureDidFetchPhotoCalled: Bool = false
    
    var successDidFetchPhotoImageCalled: Bool = false
    var failureDidFetchPhotoImageCalled: Bool = false
    
    var successDidFetchPhotoUserImageCalled: Bool = false
    var failureDidFetchPhotoUserImageCalled: Bool = false
    
    var successDidFetchPhotoCollectionCalled: Bool = false
    var failureDidFetchPhotoCollectionCalled: Bool = false
    
    var successDidFetchLocationAddressCalled: Bool = false
    var failureDidFetchLocationAddressCalled: Bool = false
    
    var successDidFetchPhotoLocationEntitiesCalled: Bool = false
    var failureDidFetchPhotoLocationEntitiesCalled: Bool = false
    
    func successDidFetchPhoto(photo: STPhoto) {
        self.successDidFetchPhotoCalled = true
    }
    
    func failureDidFetchPhoto(error: OperationError) {
        self.failureDidFetchPhotoCalled = true
    }
    
    func successDidFetchPhotoImage(image: UIImage?) {
        self.successDidFetchPhotoImageCalled = true
    }
    
    func failureDidFetchPhotoImage(error: OperationError) {
        self.failureDidFetchPhotoImageCalled = true
    }
    
    func successDidFetchPhotoUserImage(image: UIImage?) {
        self.successDidFetchPhotoUserImageCalled = true
    }
    
    func failureDidFetchPhotoUserImage(error: OperationError) {
        self.failureDidFetchPhotoUserImageCalled = true
    }
    
    func successDidFetchPhotoCollection(collection: STCollection) {
        self.successDidFetchPhotoCollectionCalled = true
    }
    
    func failureDidFetchPhotoCollection(error: OperationError) {
        self.failureDidFetchPhotoCollectionCalled = true
    }
    
    func successDidFetchLocationAddress(address: STAddress) {
        self.successDidFetchLocationAddressCalled = true
    }
    
    func failureDidFetchLocationAddress(error: OperationError) {
        self.failureDidFetchLocationAddressCalled = true
    }
    
    func successDidFetchPhotoLocationEntities(entities: [EntityLevel : GeoEntity]) {
        self.successDidFetchPhotoLocationEntitiesCalled = true
    }
    
    func failureDidFetchPhotoLocationEntities(error: OperationError) {
        self.failureDidFetchPhotoLocationEntitiesCalled = true
    }
}
