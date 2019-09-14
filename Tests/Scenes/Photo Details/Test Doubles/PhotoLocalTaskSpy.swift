//
//  PhotoLocalTaskSpy.swift
//  STPhotoDetailsTests-iOS
//
//  Created by Dimitri Strauneanu on 14/09/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class PhotoLocalTaskSpy: PhotoLocalTask {
    var photo: STPhoto = STPhoto(id: "photoId")
    var fetchPhotoCalled: Bool = false
    var shouldFailFetchPhoto: Bool = false
    
    override func fetchPhoto(photoId: String, completionHandler: @escaping (Result<STPhoto, OperationError>) -> Void) {
        self.fetchPhotoCalled = true
        
        if self.shouldFailFetchPhoto {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(self.photo))
        }
    }
}
