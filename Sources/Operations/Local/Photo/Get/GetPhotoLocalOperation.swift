//
//  GetPhotoLocalOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class GetPhotoLocalOperation: AsynchronousOperation {
    private let model: GetPhotoOperationModel.Request
    private var operationCompletionHandler: ((Result<GetPhotoOperationModel.Response, OperationError>) -> Void)
    
    var shouldFail: Bool = false
    
    init(model: GetPhotoOperationModel.Request, completionHandler: @escaping ((Result<GetPhotoOperationModel.Response, OperationError>) -> Void)) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(Int.random(in: 1...3))) {
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                let photo = self.photo(id: self.model.photoId)
                self.successBlock(response: GetPhotoOperationModel.Response(photo: photo))
            }
        }
    }
    
    private func photo(id: String) -> STPhoto {
        let photo = STPhoto(id: id)
        photo.dominantColor = "6eac5d"
        photo.collectionId = "collectionId"
        photo.blockId = 1
        photo.neighborhoodId = 2
        photo.cityId = 3
        photo.countyId = 4
        photo.stateId = 5
        photo.countryId = 6
        photo._location = [27, 47]
        photo._text = "GitHub is a development platform inspired by the way you work. From open source to business, you can host and review code, manage projects, and build software alongside 36 million developers."
        photo.likeCount = Int.random(in: 0...20)
        photo.commentCount = Int.random(in: 0...20)
        photo.user = self.user()
        return photo
    }
    
    private func user() -> STUser {
        let user = STUser(id: "userId")
        user._firstName = "John"
        user._lastName = "Doe"
        return user
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetPhotoOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
