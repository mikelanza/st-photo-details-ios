//
//  GetCollectionLocalOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class GetCollectionLocalOperation: AsynchronousOperation {
    private let model: GetCollectionOperationModel.Request
    private var operationCompletionHandler: (Result<GetCollectionOperationModel.Response, OperationError>) -> Void
    
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1...3)
    
    init(model: GetCollectionOperationModel.Request, completionHandler: @escaping (Result<GetCollectionOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(self.delay)) {
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                self.successfulResultBlock(value: GetCollectionOperationModel.Response(collection: self.collection()))
            }
        }
    }
    
    private func collection() -> STCollection {
        return STCollection(id: self.model.collectionId, name: "Iasi Photo Collection")
    }
    
    // MARK: - Successful result
    
    private func successfulResultBlock(value: GetCollectionOperationModel.Response) {
        self.operationCompletionHandler(Result.success(value))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
