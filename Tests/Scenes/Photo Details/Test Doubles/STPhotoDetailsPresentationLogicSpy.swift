//
//  STPhotoDetailsPresentationLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoDetailsPresentationLogicSpy: STPhotoDetailsPresentationLogic {
    var presentWillFetchPhotoCalled: Bool = false
    var presentDidFetchPhotoCalled: Bool = false
    var presentPhotoCalled: Bool = false
    
    var presentWillFetchPhotoImageCalled: Bool = false
    var presentDidFetchPhotoImageCalled: Bool = false
    var presentPhotoImageCalled: Bool = false
    
    var presentWillFetchPhotoUserImageCalled: Bool = false
    var presentDidFetchPhotoUserImageCalled: Bool = false
    var presentPhotoUserImageCalled: Bool = false
    
    var presentWillFetchPhotoCollectionCalled: Bool = false
    var presentDidFetchPhotoCollectionCalled: Bool = false
    var presentPhotoCollectionCalled: Bool = false
    
    var presentWillFetchPhotoLocationAddressCalled: Bool = false
    var presentDidFetchPhotoLocationAddressCalled: Bool = false
    var presentPhotoLocationAddressCalled: Bool = false
    
    var presentWillFetchPhotoLocationEntityCalled: Bool = false
    var presentDidFetchPhotoLocationEntityCalled: Bool = false
    var presentPhotoLocationEntityCalled: Bool = false
    
    var presentPhotoLikesCalled: Bool = false
    var presentPhotoCommentsCalled: Bool = false
    
    func presentWillFetchPhoto() {
        self.presentWillFetchPhotoCalled = true
    }
    
    func presentDidFetchPhoto() {
        self.presentDidFetchPhotoCalled = true
    }
    
    func presentPhoto(response: STPhotoDetails.PresentPhoto.Response) {
        self.presentPhotoCalled = true
    }
    
    func presentWillFetchPhotoImage() {
        self.presentWillFetchPhotoImageCalled = true
    }
    
    func presentDidFetchPhotoImage() {
        self.presentDidFetchPhotoImageCalled = true
    }
    
    func presentPhotoImage(response: STPhotoDetails.PresentPhotoImage.Response) {
        self.presentPhotoImageCalled = true
    }
    
    func presentWillFetchPhotoUserImage() {
        self.presentWillFetchPhotoUserImageCalled = true
    }
    
    func presentDidFetchPhotoUserImage() {
        self.presentDidFetchPhotoUserImageCalled = true
    }
    
    func presentPhotoUserImage(response: STPhotoDetails.PresentPhotoUserImage.Response) {
        self.presentPhotoUserImageCalled = true
    }
    
    func presentWillFetchPhotoCollection() {
        self.presentWillFetchPhotoCollectionCalled = true
    }
    
    func presentDidFetchPhotoCollection() {
        self.presentDidFetchPhotoCollectionCalled = true
    }
    
    func presentPhotoCollection(response: STPhotoDetails.PresentPhotoCollection.Response) {
        self.presentPhotoCollectionCalled = true
    }
    
    func presentWillFetchPhotoLocationAddress() {
        self.presentWillFetchPhotoLocationAddressCalled = true
    }
    
    func presentDidFetchPhotoLocationAddress() {
        self.presentDidFetchPhotoLocationAddressCalled = true
    }
    
    func presentPhotoLocationAddress(response: STPhotoDetails.PresentPhotoLocationAddress.Response) {
        self.presentPhotoLocationAddressCalled = true
    }
    
    func presentWillFetchPhotoLocationEntity(response: STPhotoDetails.PhotoLocationEntityLoadingState.Response) {
        self.presentWillFetchPhotoLocationEntityCalled = true
    }
    
    func presentDidFetchPhotoLocationEntity(response: STPhotoDetails.PhotoLocationEntityLoadingState.Response) {
        self.presentDidFetchPhotoLocationEntityCalled = true
    }
    
    func presentPhotoLocationEntity(response: STPhotoDetails.PresentPhotoLocationEntity.Response) {
        self.presentPhotoLocationEntityCalled = true
    }
    
    func presentPhotoLikes(response: STPhotoDetails.PresentPhotoLikes.Response) {
        self.presentPhotoLikesCalled = true
    }
    
    func presentPhotoComments(response: STPhotoDetails.PresentPhotoComments.Response) {
        self.presentPhotoCommentsCalled = true
    }
}
