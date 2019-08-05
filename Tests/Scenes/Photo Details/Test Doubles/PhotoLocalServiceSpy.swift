//
//  PhotoLocalServiceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class PhotoLocalServiceSpy: PhotoLocalService {
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
