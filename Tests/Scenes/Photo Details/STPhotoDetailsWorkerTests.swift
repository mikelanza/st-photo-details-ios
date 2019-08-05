//
//  STPhotoDetailsWorkerTests.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright (c) 2019 Streetography. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import STPhotoDetails
import XCTest
import STPhotoCore

class STPhotoDetailsWorkerTests: XCTestCase {
    var sut: STPhotoDetailsWorker!
    var delegateSpy: STPhotoDetailsWorkerDelegateSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.setupSTPhotoDetailsWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSTPhotoDetailsWorker() {
        self.delegateSpy = STPhotoDetailsWorkerDelegateSpy()
        
        self.sut = STPhotoDetailsWorker(delegate: self.delegateSpy)
    }
    
    // MARK: - Tests
    
    func testFetchPhotoImage() {
        let serviceSpy = ImageLocalServiceSpy()
        self.sut.imageService = serviceSpy
        self.sut.fetchPhotoImage(url: "https://streetography.com")
        XCTAssertTrue(serviceSpy.fetchImageCalled)
    }
    
    func testFetchPhotoImageShouldAskTheDelegateToSendImageForSuccessCase() {
        let serviceSpy = ImageLocalServiceSpy()
        serviceSpy.shouldFailFetchImage = false
        self.sut.imageService = serviceSpy
        
        self.sut.fetchPhotoImage(url: "https://streetography.com")
        XCTAssertTrue(self.delegateSpy.successDidFetchPhotoImageCalled)
    }
    
    func testFetchPhotoImageShouldAskTheDelegateToSendErrorForFailureCase() {
        let serviceSpy = ImageLocalServiceSpy()
        serviceSpy.shouldFailFetchImage = true
        self.sut.imageService = serviceSpy
        
        self.sut.fetchPhotoImage(url: "https://streetography.com")
        XCTAssertTrue(self.delegateSpy.failureDidFetchPhotoImageCalled)
    }
    
    func testFetchPhotoUserImage() {
        let serviceSpy = ImageLocalServiceSpy()
        self.sut.imageService = serviceSpy
        self.sut.fetchPhotoUserImage(url: "https://streetography.com")
        XCTAssertTrue(serviceSpy.fetchImageCalled)
    }
    
    func testFetchPhotoUserImageShouldAskTheDelegateToSendImageForSuccessCase() {
        let serviceSpy = ImageLocalServiceSpy()
        serviceSpy.shouldFailFetchImage = false
        self.sut.imageService = serviceSpy
        
        self.sut.fetchPhotoUserImage(url: "https://streetography.com")
        XCTAssertTrue(self.delegateSpy.successDidFetchPhotoUserImageCalled)
    }
    
    func testFetchPhotoUserImageShouldAskTheDelegateToSendErrorForFailureCase() {
        let serviceSpy = ImageLocalServiceSpy()
        serviceSpy.shouldFailFetchImage = true
        self.sut.imageService = serviceSpy
        
        self.sut.fetchPhotoUserImage(url: "https://streetography.com")
        XCTAssertTrue(self.delegateSpy.failureDidFetchPhotoUserImageCalled)
    }
    
    func testFetchPhoto() {
        let serviceSpy = PhotoLocalServiceSpy()
        self.sut.photoService = serviceSpy
        self.sut.fetchPhoto(photoId: "photoId")
        XCTAssertTrue(serviceSpy.fetchPhotoCalled)
    }
    
    func testFetchPhotoShouldAskTheDelegateToSendPhotoForSuccessCase() {
        let serviceSpy = PhotoLocalServiceSpy()
        serviceSpy.shouldFailFetchPhoto = false
        self.sut.photoService = serviceSpy
        self.sut.fetchPhoto(photoId: "photoId")
        XCTAssertTrue(self.delegateSpy.successDidFetchPhotoCalled)
    }
    
    func testFetchPhotoShouldAskTheDelegateToSendErrorForFailureCase() {
        let serviceSpy = PhotoLocalServiceSpy()
        serviceSpy.shouldFailFetchPhoto = true
        self.sut.photoService = serviceSpy
        self.sut.fetchPhoto(photoId: "photoId")
        XCTAssertTrue(self.delegateSpy.failureDidFetchPhotoCalled)
    }
    
    func testFetchPhotoCollection() {
        let serviceSpy = PhotoCollectionLocalServiceSpy()
        self.sut.photoCollectionService = serviceSpy
        self.sut.fetchPhotoCollection(id: "collectionId")
        XCTAssertTrue(serviceSpy.fetchPhotoCollectionCalled)
    }
    
    func testFetchPhotoCollectionShouldAskTheDelegateToSendCollectionForSuccessCase() {
        let serviceSpy = PhotoCollectionLocalServiceSpy()
        serviceSpy.shouldFailFetchPhotoCollection = false
        self.sut.photoCollectionService = serviceSpy
        self.sut.fetchPhotoCollection(id: "collectionId")
        XCTAssertTrue(self.delegateSpy.successDidFetchPhotoCollectionCalled)
    }
    
    func testFetchPhotoCollectionShouldAskTheDelegateToSendErrorForFailureCase() {
        let serviceSpy = PhotoCollectionLocalServiceSpy()
        serviceSpy.shouldFailFetchPhotoCollection = true
        self.sut.photoCollectionService = serviceSpy
        self.sut.fetchPhotoCollection(id: "collectionId")
        XCTAssertTrue(self.delegateSpy.failureDidFetchPhotoCollectionCalled)
    }
    
    func testFetchPhotoLocationAddress() {
        let serviceSpy = LocationAddressLocalServiceSpy()
        self.sut.locationAddressService = serviceSpy
        self.sut.fetchPhotoLocationAddress(location: STLocation(latitude: 46, longitude: 25))
        XCTAssertTrue(serviceSpy.fetchLocationAddressCalled)
    }
    
    func testFetchPhotoLocationAddressShouldAskTheDelegateToSendAddressForSuccessCase() {
        let serviceSpy = LocationAddressLocalServiceSpy()
        serviceSpy.shouldFailFetchLocationAddress = false
        self.sut.locationAddressService = serviceSpy
        self.sut.fetchPhotoLocationAddress(location: STLocation(latitude: 46, longitude: 25))
        XCTAssertTrue(self.delegateSpy.successDidFetchLocationAddressCalled)
    }
    
    func testFetchPhotoLocationAddressShouldAskTheDelegateToSendErrorForFailureCase() {
        let serviceSpy = LocationAddressLocalServiceSpy()
        serviceSpy.shouldFailFetchLocationAddress = true
        self.sut.locationAddressService = serviceSpy
        self.sut.fetchPhotoLocationAddress(location: STLocation(latitude: 46, longitude: 25))
        XCTAssertTrue(self.delegateSpy.failureDidFetchLocationAddressCalled)
    }
    
    func testFetchPhotoLocationEntities() {
        let serviceSpy = LocationEntitiesLocalServiceSpy()
        self.sut.locationEntitiesService = serviceSpy
        self.sut.fetchPhotoLocationEntities(location: STLocation(latitude: 46, longitude: 25))
        XCTAssertTrue(serviceSpy.fetchPhotoEntitiesCalled)
    }
    
    func testFetchPhotoLocationEntitiesShouldAskTheDelegateToSendEntitiesForSuccessCase() {
        let serviceSpy = LocationEntitiesLocalServiceSpy()
        serviceSpy.shouldFailFetchPhotoEntities = false
        self.sut.locationEntitiesService = serviceSpy
        self.sut.fetchPhotoLocationEntities(location: STLocation(latitude: 46, longitude: 25))
        XCTAssertTrue(self.delegateSpy.successDidFetchPhotoLocationEntitiesCalled)
    }
    
    func testFetchPhotoLocationEntitiesShouldAskTheDelegateToSendErrorForFailureCase() {
        let serviceSpy = LocationEntitiesLocalServiceSpy()
        serviceSpy.shouldFailFetchPhotoEntities = true
        self.sut.locationEntitiesService = serviceSpy
        self.sut.fetchPhotoLocationEntities(location: STLocation(latitude: 46, longitude: 25))
        XCTAssertTrue(self.delegateSpy.failureDidFetchPhotoLocationEntitiesCalled)
    }
}
