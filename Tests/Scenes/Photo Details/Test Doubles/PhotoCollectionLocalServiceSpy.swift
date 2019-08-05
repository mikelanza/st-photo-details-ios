//
//  PhotoCollectionLocalServiceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class PhotoCollectionLocalServiceSpy: PhotoCollectionLocalService {
    var collection: STCollection = STCollection(id: "collectionId")
    var fetchPhotoCollectionCalled: Bool = false
    var shouldFailFetchPhotoCollection: Bool = false
    
    override func fetchPhotoCollection(collectionId: String, completionHandler: @escaping (Result<STCollection, OperationError>) -> Void) {
        self.fetchPhotoCollectionCalled = true
        
        if self.shouldFailFetchPhotoCollection {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(self.collection))
        }
    }
}
