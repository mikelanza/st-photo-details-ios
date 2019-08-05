//
//  STPhotoCommentsPresentationLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoCommentsPresentationLogicSpy: STPhotoCommentsPresentationLogic {
    var presentWillFetchPhotoCommentsCalled: Bool = false
    var presentDidFetchPhotoCommentsCalled: Bool = false
    var presentPhotoCommentsCalled: Bool = false
    
    var presentEmptyStateCalled: Bool = false
    
    var presentWillFetchAvatarImageCalled: Bool = false
    var presentDidFetchAvatarImageCalled: Bool = false
    var presentAvatarImageCalled: Bool = false
    
    func presentWillFetchPhotoComments() {
        self.presentWillFetchPhotoCommentsCalled = true
    }
    
    func presentDidFetchPhotoComments() {
        self.presentDidFetchPhotoCommentsCalled = true
    }
    
    func presentPhotoComments(response: STPhotoComments.PresentComments.Response) {
        self.presentPhotoCommentsCalled = true
    }
    
    func presentEmptyState() {
        self.presentEmptyStateCalled = true
    }
    
    func presentWillFetchAvatarImage(response: STPhotoComments.FetchAvatarImage.Response) {
        self.presentWillFetchAvatarImageCalled = true
    }
    
    func presentDidFetchAvatarImage(response: STPhotoComments.FetchAvatarImage.Response) {
        self.presentDidFetchAvatarImageCalled = true
    }
    
    func presentAvatarImage(response: STPhotoComments.PresentAvatarImage.Response) {
        self.presentAvatarImageCalled = true
    }
}
