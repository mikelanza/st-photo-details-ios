//
//  PhotoCollectionLocalTaskSpy.swift
//  STPhotoDetailsTests-iOS
//
//  Created by Dimitri Strauneanu on 14/09/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class PhotoCollectionLocalTaskSpy: PhotoCollectionLocalTask {
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
