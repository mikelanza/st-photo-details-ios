//
//  STPhotoCommentsWorkerDelegateSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 03/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit
import STPhotoCore

class STPhotoCommentsWorkerDelegateSpy: STPhotoCommentsWorkerDelegate {
    var successDidFetchPhotoCommentsCalled: Bool = false
    var failureDidFetchPhotoCommentsCalled: Bool = false
    
    var successDidFetchAvatarImageCalled: Bool = false
    var failureDidFetchAvatarImageCalled: Bool = false
    
    func successDidFetchPhotoComments(comments: [STComment]) {
        self.successDidFetchPhotoCommentsCalled = true
    }
    
    func failureDidFetchPhotoComments(error: OperationError) {
        self.failureDidFetchPhotoCommentsCalled = true
    }
    
    func successDidFetchAvatarImage(image: UIImage?, displayedComment: STPhotoComments.DisplayedComment) {
        self.successDidFetchAvatarImageCalled = true
    }
    
    func failureDidFetchAvatarImage(displayedComment: STPhotoComments.DisplayedComment, error: OperationError) {
        self.failureDidFetchAvatarImageCalled = true
    }
}
