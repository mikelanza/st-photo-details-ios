//
//  STPhotoDetailsInteractorTests.swift
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

class STPhotoDetailsInteractorTests: XCTestCase {
    var sut: STPhotoDetailsInteractor!
    var presenterSpy: STPhotoDetailsPresentationLogicSpy!
    var workerSpy: STPhotoDetailsWorkerSpy!
  
    // MARK: - Test lifecycle
  
    override func setUp() {
        super.setUp()
        self.setupSTPhotoDetailsInteractor()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: - Test setup
  
    func setupSTPhotoDetailsInteractor() {
        self.sut = STPhotoDetailsInteractor()
        
        self.presenterSpy = STPhotoDetailsPresentationLogicSpy()
        self.sut.presenter = self.presenterSpy
        
        self.workerSpy = STPhotoDetailsWorkerSpy(delegate: self.sut)
        self.sut.worker = self.workerSpy
    }
    
    // MARK: - Tests
    
    func testSetPhotoIdShouldUpdatePhotoId() {
        self.sut.photoId = "photoId"
        
        let photoId = "newPhotoId"
        self.sut.setPhotoId(id: photoId)
        XCTAssertEqual(self.sut.photoId, photoId)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhoto() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoCalled)
    }
    
    func testShouldFetchPhotoShouldAskTheWorkerToFetchPhoto() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.workerSpy.fetchPhotoCalled)
    }
    
    func testShouldFetchPhotoShouldUpdatePhotoForSuccessCase() {
        let photo = STPhoto(id: "newPhotoId")
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhoto = false
        
        self.sut.photo = STPhoto(id: "photoId")
        self.sut.shouldFetchPhoto()
        XCTAssertEqual(self.sut.photo, photo)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoForSuccessCase() {
        self.workerSpy.shouldFailFetchPhoto = false
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoForFailureCase() {
        self.workerSpy.shouldFailFetchPhoto = true
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhoto() {
        self.workerSpy.shouldFailFetchPhoto = false
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskTheWorkerToFetchPhotoImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.workerSpy.fetchPhotoImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoImageForFailureCase() {
        self.workerSpy.shouldFailFetchPhotoImage = true
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterNotToPresentPhotoImageForFailureCase() {
        self.workerSpy.shouldFailFetchPhotoImage = true
        self.sut.shouldFetchPhoto()
        XCTAssertFalse(self.presenterSpy.presentPhotoImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoUserImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoUserImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskTheWorkerToFetchPhotoUserImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.workerSpy.fetchPhotoUserImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoUserImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoUserImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoUserImage() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoUserImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoUserImageForFailureCase() {
        self.workerSpy.shouldFailFetchPhotoUserImage = true
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoUserImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterNotToPresentPhotoUserImageForFailureCase() {
        self.workerSpy.shouldFailFetchPhotoUserImage = true
        self.sut.shouldFetchPhoto()
        XCTAssertFalse(self.presenterSpy.presentPhotoUserImageCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoCollection() {
        let photo = self.photo()
        photo.collectionId = "collectionId"
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoCollectionCalled)
    }
    
    func testShouldFetchPhotoShouldAskTheWorkerToFetchPhotoCollection() {
        let photo = self.photo()
        photo.collectionId = "collectionId"
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.workerSpy.fetchPhotoCollectionCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoCollection() {
        let photo = self.photo()
        photo.collectionId = "collectionId"
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoCollectionCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoCollection() {
        let photo = self.photo()
        photo.collectionId = "collectionId"
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoCollectionCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoCollectionForFailureCase() {
        let photo = self.photo()
        photo.collectionId = "collectionId"
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoCollection = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoCollectionCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterNotToPresentPhotoCollectionForFailureCase() {
        let photo = self.photo()
        photo.collectionId = "collectionId"
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoCollection = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertFalse(self.presenterSpy.presentPhotoCollectionCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationAddress() {
        let photo = self.photo()
        photo._location = [27, 47]
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationAddressCalled)
    }
    
    func testShouldFetchPhotoShouldAskTheWorkerToFetchPhotoLocationAddress() {
        let photo = self.photo()
        photo._location = [27, 47]
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.workerSpy.fetchPhotoLocationAddressCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationAddress() {
        let photo = self.photo()
        photo._location = [27, 47]
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationAddressCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationAddress() {
        let photo = self.photo()
        photo._location = [27, 47]
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationAddressCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationAddressForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationAddress = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationAddressCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterNotToPresentPhotoLocationAddressForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationAddress = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertFalse(self.presenterSpy.presentPhotoLocationAddressCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationEntityForBlock() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.blockId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationEntityForNeighborhood() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.neighborhoodId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationEntityForCity() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.cityId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationEntityForCounty() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countyId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationEntityForState() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.stateId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentWillFetchPhotoLocationEntityForCountry() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countryId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskTheWorkerToFetchPhotoLocationEntities() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countryId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.workerSpy.fetchPhotoLocationEntitiesCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForBlock() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.blockId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForNeighborhood() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.neighborhoodId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForCity() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.cityId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForCounty() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countyId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForState() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.stateId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForCountry() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countryId = 1
        self.workerSpy.photo = photo
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationEntityForBlock() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.blockId = 1
        self.workerSpy.photo = photo
        self.workerSpy.entities = [EntityLevel.block : self.entity(id: 1, entityLevel: EntityLevel.block, name: "Block")]
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationEntityForNeighborhood() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.neighborhoodId = 1
        self.workerSpy.photo = photo
        self.workerSpy.entities = [EntityLevel.neighborhood : self.entity(id: 1, entityLevel: EntityLevel.neighborhood, name: "Neighborhood")]
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationEntityForCity() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.cityId = 1
        self.workerSpy.photo = photo
        self.workerSpy.entities = [EntityLevel.city : self.entity(id: 1, entityLevel: EntityLevel.city, name: "City")]
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationEntityForCounty() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countyId = 1
        self.workerSpy.photo = photo
        self.workerSpy.entities = [EntityLevel.county : self.entity(id: 1, entityLevel: EntityLevel.county, name: "County")]
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationEntityForState() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.stateId = 1
        self.workerSpy.photo = photo
        self.workerSpy.entities = [EntityLevel.state : self.entity(id: 1, entityLevel: EntityLevel.state, name: "State")]
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLocationEntityForCountry() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countryId = 1
        self.workerSpy.photo = photo
        self.workerSpy.entities = [EntityLevel.country : self.entity(id: 1, entityLevel: EntityLevel.country, name: "Country")]
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLocationEntityCalled)
    }
    
    private func entity(id: Int, entityLevel: EntityLevel, name: String) -> GeoEntity {
        var entity = GeoEntity(id: id, boundingBox: BoundingBox(boundingCoordinates: (50, 50, 60, 60)))
        entity.name = name
        entity.entityLevel = entityLevel
        return entity
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForBlockForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.blockId = 1
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationEntities = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForNeighborhoodForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.neighborhoodId = 1
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationEntities = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForCityForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.cityId = 1
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationEntities = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForCountyForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countyId = 1
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationEntities = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForStateForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.stateId = 1
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationEntities = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentDidFetchPhotoLocationEntityForCountryForFailureCase() {
        let photo = self.photo()
        photo._location = [27, 47]
        photo.countryId = 1
        self.workerSpy.photo = photo
        self.workerSpy.shouldFailFetchPhotoLocationEntities = true
        
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoLocationEntityCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoLikes() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoLikesCalled)
    }
    
    func testShouldFetchPhotoShouldAskThePresenterToPresentPhotoComments() {
        self.sut.shouldFetchPhoto()
        XCTAssertTrue(self.presenterSpy.presentPhotoCommentsCalled)
    }
    
    private func photo() -> STPhoto {
        return STPhoto(id: "photoId")
    }
}

extension STPhoto: Equatable {
    public static func ==(lhs: STPhoto, rhs: STPhoto) -> Bool {
        return lhs.id == rhs.id
    }
}
