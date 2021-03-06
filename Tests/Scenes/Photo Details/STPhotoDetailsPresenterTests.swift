//
//  STPhotoDetailsPresenterTests.swift
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

class STPhotoDetailsPresenterTests: XCTestCase {
    var sut: STPhotoDetailsPresenter!
    var displayerSpy: STPhotoDetailsDisplayLogicSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.setupSTPhotoDetailsPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSTPhotoDetailsPresenter() {
        self.sut = STPhotoDetailsPresenter()
        
        self.displayerSpy = STPhotoDetailsDisplayLogicSpy()
        self.sut.displayer = self.displayerSpy
    }
    
    // MARK: - Tests
    
    func testPresentWillFetchPhotoShouldAskTheDisplayerToDisplayWillFetchPhoto() {
        self.sut.presentWillFetchPhoto()
        XCTAssertTrue(self.displayerSpy.displayWillFetchPhotoCalled)
    }
    
    func testPresentDidFetchPhotoShouldAskTheDisplayerToDisplayDidFetchPhoto() {
        self.sut.presentDidFetchPhoto()
        XCTAssertTrue(self.displayerSpy.displayDidFetchPhotoCalled)
    }
    
    func testPresentPhotoShouldAskTheDisplayerToDisplayPhoto() {
        let photo = STPhoto(id: "photoId")
        self.sut.presentPhoto(response: STPhotoDetails.PresentPhoto.Response(photo: photo))
        XCTAssertTrue(self.displayerSpy.displayPhotoCalled)
    }
    
    func testPresentWillFetchPhotoImageShouldAskTheDisplayerToDisplayWillFetchPhotoImage() {
        self.sut.presentWillFetchPhotoImage()
        XCTAssertTrue(self.displayerSpy.displayWillFetchPhotoImageCalled)
    }
    
    func testPresentDidFetchPhotoImageShouldAskTheDisplayerToDisplayDidFetchPhotoImage() {
        self.sut.presentDidFetchPhotoImage()
        XCTAssertTrue(self.displayerSpy.displayDidFetchPhotoImageCalled)
    }
    
    func testPresentPhotoImageShouldAskTheDisplayerToDisplayPhotoImage() {
        self.sut.presentPhotoImage(response: STPhotoDetails.PresentPhotoImage.Response(image: UIImage()))
        XCTAssertTrue(self.displayerSpy.displayPhotoImageCalled)
    }
    
    func testPresentWillFetchPhotoUserImageShouldAskTheDisplayerToDisplayWillFetchPhotoUserImage() {
        self.sut.presentWillFetchPhotoUserImage()
        XCTAssertTrue(self.displayerSpy.displayWillFetchPhotoUserImageCalled)
    }
    
    func testPresentDidFetchPhotoUserImageShouldAskTheDisplayerToDisplayDidFetchPhotoUserImage() {
        self.sut.presentDidFetchPhotoUserImage()
        XCTAssertTrue(self.displayerSpy.displayDidFetchPhotoUserImageCalled)
    }
    
    func testPresentPhotoUserImageShouldAskTheDisplayerToDisplayPhotoUserImage() {
        self.sut.presentPhotoUserImage(response: STPhotoDetails.PresentPhotoUserImage.Response(image: UIImage()))
        XCTAssertTrue(self.displayerSpy.displayPhotoUserImageCalled)
    }
    
    func testPresentWillFetchPhotoCollectionShouldAskTheDisplayerToDisplayWillFetchPhotoCollection() {
        self.sut.presentWillFetchPhotoCollection()
        XCTAssertTrue(self.displayerSpy.displayWillFetchPhotoCollectionCalled)
    }
    
    func testPresentDidFetchPhotoCollectionShouldAskTheDisplayerToDisplayDidFetchPhotoCollection() {
        self.sut.presentDidFetchPhotoCollection()
        XCTAssertTrue(self.displayerSpy.displayDidFetchPhotoCollectionCalled)
    }
    
    func testPresentPhotoCollectionShouldAskTheDisplayerToDisplayPhotoCollection() {
        self.sut.presentPhotoCollection(response: STPhotoDetails.PresentPhotoCollection.Response(collection: STCollection(id: "id")))
        XCTAssertTrue(self.displayerSpy.displayPhotoCollectionCalled)
    }
    
    func testPresentWillFetchPhotoLocationAddressShouldAskTheDisplayerToDisplayWillFetchPhotoLocationAddress() {
        self.sut.presentWillFetchPhotoLocationAddress()
        XCTAssertTrue(self.displayerSpy.displayWillFetchPhotoLocationAddressCalled)
    }
    
    func testPresentDidFetchPhotoLocationAddressShouldAskTheDisplayerToDisplayDidFetchPhotoLocationAddress() {
        self.sut.presentDidFetchPhotoLocationAddress()
        XCTAssertTrue(self.displayerSpy.displayDidFetchPhotoLocationAddressCalled)
    }
    
    func testPresentPhotoLocationAddressShouldAskTheDisplayerToDisplayPhotoLocationAddress() {
        self.sut.presentPhotoLocationAddress(response: STPhotoDetails.PresentPhotoLocationAddress.Response(address: STAddress()))
        XCTAssertTrue(self.displayerSpy.displayPhotoLocationAddressCalled)
    }
    
    func testPresentWillFetchPhotoLocationEntityShouldAskTheDisplayerToDisplayWillFetchPhotoLocationEntity() {
        self.sut.presentWillFetchPhotoLocationEntity(response: STPhotoDetails.PhotoLocationEntityLoadingState.Response(type: STPhotoDetails.ItemType.blockEntity))
        XCTAssertTrue(self.displayerSpy.displayWillFetchPhotoLocationEntityCalled)
    }
    
    func testPresentDidFetchPhotoLocationEntityShouldAskTheDisplayerToDisplayDidFetchPhotoLocationEntity() {
        self.sut.presentDidFetchPhotoLocationEntity(response: STPhotoDetails.PhotoLocationEntityLoadingState.Response(type: STPhotoDetails.ItemType.blockEntity))
        XCTAssertTrue(self.displayerSpy.displayDidFetchPhotoLocationEntityCalled)
    }
    
    func testPresentPhotoLocationEntityShouldAskTheDisplayerToDisplayPhotoLocationEntity() {
        self.sut.presentPhotoLocationEntity(response: STPhotoDetails.PresentPhotoLocationEntity.Response(type: STPhotoDetails.ItemType.blockEntity, geoEntity: self.entity(id: 1, entityLevel: EntityLevel.block, name: "Block")))
        XCTAssertTrue(self.displayerSpy.displayPhotoLocationEntityCalled)
    }
    
    private func entity(id: Int, entityLevel: EntityLevel, name: String) -> GeoEntity {
        var entity = GeoEntity(id: id, boundingBox: BoundingBox(boundingCoordinates: (50, 50, 60, 60)))
        entity.name = name
        entity.entityLevel = entityLevel
        return entity
    }
    
    func testPresentPhotoLikesShouldAskTheDisplayerToDisplayPhotoLikes() {
        self.sut.presentPhotoLikes(response: STPhotoDetails.PresentPhotoLikes.Response(count: 5))
        XCTAssertTrue(self.displayerSpy.displayPhotoLikesCalled)
    }
    
    func testPresentPhotoLikesShouldAskTheDisplayerToDisplayPhotoComments() {
        self.sut.presentPhotoComments(response: STPhotoDetails.PresentPhotoComments.Response(count: 5))
        XCTAssertTrue(self.displayerSpy.displayPhotoCommentsCalled)
    }
}
