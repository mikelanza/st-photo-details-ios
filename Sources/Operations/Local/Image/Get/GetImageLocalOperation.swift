//
//  GetImageLocalOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit
import STPhotoCore

class GetImageLocalOperation: AsynchronousOperation {
    private let model: GetImageOperationModel.Request
    private var operationCompletionHandler: ((Result<GetImageOperationModel.Response, OperationError>) -> Void)
    
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1...3)
    
    init(model: GetImageOperationModel.Request, completionHandler: @escaping ((Result<GetImageOperationModel.Response, OperationError>) -> Void)) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(self.delay)) {
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                self.successBlock(response: GetImageOperationModel.Response(image: UIImage(named: "st_photo_details_watch", in: Bundle.module, compatibleWith: nil)))
            }
        }
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetImageOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
