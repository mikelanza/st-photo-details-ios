//
//  PhotoCommentsLocalServiceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class PhotoCommentsLocalServiceSpy: PhotoCommentsLocalService {
    var comments: [STComment] = []
    var fetchPhotoCommentsCalled: Bool = false
    var shouldFailFetchPhotoComments: Bool = false
    
    override func fetchPhotoComments(photoId: String, page: Int, limit: Int, completionHandler: @escaping (Result<[STComment], OperationError>) -> Void) {
        self.fetchPhotoCommentsCalled = true
        
        if self.shouldFailFetchPhotoComments {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(self.comments))
        }
    }
}
