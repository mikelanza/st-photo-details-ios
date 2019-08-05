//
//  STPhotoDetailsDisplayLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoDetailsDisplayLogicSpy: STPhotoDetailsDisplayLogic {
    var displayWillFetchPhotoCalled: Bool = false
    var displayDidFetchPhotoCalled: Bool = false
    var displayPhotoCalled: Bool = false
    
    var displayWillFetchPhotoImageCalled: Bool = false
    var displayDidFetchPhotoImageCalled: Bool = false
    var displayPhotoImageCalled: Bool = false
    
    var displayWillFetchPhotoUserImageCalled: Bool = false
    var displayDidFetchPhotoUserImageCalled: Bool = false
    var displayPhotoUserImageCalled: Bool = false
    
    var displayWillFetchPhotoCollectionCalled: Bool = false
    var displayDidFetchPhotoCollectionCalled: Bool = false
    var displayPhotoCollectionCalled: Bool = false
    
    var displayWillFetchPhotoLocationAddressCalled: Bool = false
    var displayDidFetchPhotoLocationAddressCalled: Bool = false
    var displayPhotoLocationAddressCalled: Bool = false
    
    var displayWillFetchPhotoLocationEntityCalled: Bool = false
    var displayDidFetchPhotoLocationEntityCalled: Bool = false
    var displayPhotoLocationEntityCalled: Bool = false
    
    var displayPhotoLikesCalled: Bool = false
    var displayPhotoCommentsCalled: Bool = false
    
    func displayWillFetchPhoto() {
        self.displayWillFetchPhotoCalled = true
    }
    
    func displayDidFetchPhoto() {
        self.displayDidFetchPhotoCalled = true
    }
    
    func displayPhoto(viewModel: STPhotoDetails.PresentPhoto.ViewModel) {
        self.displayPhotoCalled = true
    }
    
    func displayWillFetchPhotoImage() {
        self.displayWillFetchPhotoImageCalled = true
    }
    
    func displayDidFetchPhotoImage() {
        self.displayDidFetchPhotoImageCalled = true
    }
    
    func displayPhotoImage(viewModel: STPhotoDetails.PresentPhotoImage.ViewModel) {
        self.displayPhotoImageCalled = true
    }
    
    func displayWillFetchPhotoUserImage() {
        self.displayWillFetchPhotoUserImageCalled = true
    }
    
    func displayDidFetchPhotoUserImage() {
        self.displayDidFetchPhotoUserImageCalled = true
    }
    
    func displayPhotoUserImage(viewModel: STPhotoDetails.PresentPhotoUserImage.ViewModel) {
        self.displayPhotoUserImageCalled = true
    }
    
    func displayWillFetchPhotoCollection() {
        self.displayWillFetchPhotoCollectionCalled = true
    }
    
    func displayDidFetchPhotoCollection() {
        self.displayDidFetchPhotoCollectionCalled = true
    }
    
    func displayPhotoCollection(viewModel: STPhotoDetails.PresentPhotoCollection.ViewModel) {
        self.displayPhotoCollectionCalled = true
    }
    
    func displayWillFetchPhotoLocationAddress() {
        self.displayWillFetchPhotoLocationAddressCalled = true
    }
    
    func displayDidFetchPhotoLocationAddress() {
        self.displayDidFetchPhotoLocationAddressCalled = true
    }
    
    func displayPhotoLocationAddress(viewModel: STPhotoDetails.PresentPhotoLocationAddress.ViewModel) {
        self.displayPhotoLocationAddressCalled = true
    }
    
    func displayWillFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel) {
        self.displayWillFetchPhotoLocationEntityCalled = true
    }
    
    func displayDidFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel) {
        self.displayDidFetchPhotoLocationEntityCalled = true
    }
    
    func displayPhotoLocationEntity(viewModel: STPhotoDetails.PresentPhotoLocationEntity.ViewModel) {
        self.displayPhotoLocationEntityCalled = true
    }
    
    func displayPhotoLikes(viewModel: STPhotoDetails.PresentPhotoLikes.ViewModel) {
        self.displayPhotoLikesCalled = true
    }
    
    func displayPhotoComments(viewModel: STPhotoDetails.PresentPhotoComments.ViewModel) {
        self.displayPhotoCommentsCalled = true
    }
}
