//
//  STPhotoCommentsWorkerSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit
import STPhotoCore

class STPhotoCommentsWorkerSpy: STPhotoCommentsWorker {
    var comments: [STComment] = []
    
    var fetchPhotoCommentsCalled: Bool = false
    var shouldFailFetchPhotoComments: Bool = false
    
    var fetchAvatarImageCalled: Bool = false
    var shouldFailFetchAvatarImage: Bool = false
    
    override func fetchPhotoComments(photoId: String, page: Int, limit: Int) {
        self.fetchPhotoCommentsCalled = true
        
        if self.shouldFailFetchPhotoComments {
            self.delegate?.failureDidFetchPhotoComments(error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchPhotoComments(comments: self.comments)
        }
    }
    
    override func fetchAvatarImage(displayedComment: STPhotoComments.DisplayedComment) {
        self.fetchAvatarImageCalled = true
        
        if self.shouldFailFetchAvatarImage {
            self.delegate?.failureDidFetchAvatarImage(displayedComment: displayedComment, error: OperationError.noDataAvailable)
        } else {
            self.delegate?.successDidFetchAvatarImage(image: UIImage(), displayedComment: displayedComment)
        }
    }
}
