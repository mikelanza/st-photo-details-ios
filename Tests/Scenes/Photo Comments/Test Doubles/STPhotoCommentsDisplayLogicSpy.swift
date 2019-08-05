//
//  STPhotoCommentsDisplayLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoCommentsDisplayLogicSpy: STPhotoCommentsDisplayLogic {
    var displayWillFetchPhotoCommentsCalled: Bool = false
    var displayDidFetchPhotoCommentsCalled: Bool = false
    var displayPhotoCommentsCalled: Bool = false
    
    var displayEmptyStateCalled: Bool = false
    
    var displayWillFetchAvatarImageCalled: Bool = false
    var displayDidFetchAvatarImageCalled: Bool = false
    var displayAvatarImageCalled: Bool = false
    
    func displayWillFetchPhotoComments() {
        self.displayWillFetchPhotoCommentsCalled = true
    }
    
    func displayDidFetchPhotoComments() {
        self.displayDidFetchPhotoCommentsCalled = true
    }
    
    func displayPhotoComments(viewModel: STPhotoComments.PresentComments.ViewModel) {
        self.displayPhotoCommentsCalled = true
    }
    
    func displayEmptyState() {
        self.displayEmptyStateCalled = true
    }
    
    func displayWillFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel) {
        self.displayWillFetchAvatarImageCalled = true
    }
    
    func displayDidFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel) {
        self.displayDidFetchAvatarImageCalled = true
    }
    
    func displayAvatarImage(viewModel: STPhotoComments.PresentAvatarImage.ViewModel) {
        self.displayAvatarImageCalled = true
    }
}
