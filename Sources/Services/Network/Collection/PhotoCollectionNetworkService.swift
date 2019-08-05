//
//  PhotoCollectionNetworkService.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class PhotoCollectionNetworkService: PhotoCollectionServiceProtocol {
    let operationQueue = OperationQueue()
    
    func fetchPhotoCollection(collectionId: String, completionHandler: @escaping (Result<STCollection, OperationError>) -> Void) {
        let operation = GetCollectionOperation(model: GetCollectionOperationModel.Request(collectionId: collectionId)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.collection)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
