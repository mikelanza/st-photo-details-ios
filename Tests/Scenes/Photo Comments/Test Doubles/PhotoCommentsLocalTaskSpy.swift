//
//  PhotoCommentsLocalTaskSpy.swift
//  STPhotoDetailsTests-iOS
//
//  Created by Dimitri Strauneanu on 14/09/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class PhotoCommentsLocalTaskSpy: PhotoCommentsLocalTask {
    var comments: [STComment] = []
    var fetchPhotoCommentsCalled: Bool = false
    var shouldFailFetchPhotoComments: Bool = false
    
    override func fetchPhotoComments(model: PhotoCommentsTaskModel.Fetch, completionHandler: @escaping (Result<[STComment], OperationError>) -> Void) {
        self.fetchPhotoCommentsCalled = true
        
        if self.shouldFailFetchPhotoComments {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(self.comments))
        }
    }
}
