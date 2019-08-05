//
//  PhotoCommentsLocalService.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class PhotoCommentsLocalService: PhotoCommentsServiceProtocol {
    let operationQueue = OperationQueue()
        
    func fetchPhotoComments(photoId: String, page: Int, limit: Int, completionHandler: @escaping (Result<[STComment], OperationError>) -> Void) {
        let operation = GetCommentsLocalOperation(model: GetCommentsOperationModel.Request(photoId: photoId, limit: limit, page: page)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.comments)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
