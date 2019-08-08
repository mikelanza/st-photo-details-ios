//
//  GetImageOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit
import STPhotoCore

class GetImageOperation: AsynchronousOperation {
    private let model: GetImageOperationModel.Request
    private var operationCompletionHandler: ((Result<GetImageOperationModel.Response, OperationError>) -> Void)
    
    private var task: URLSessionDataTask?
    
    init(model: GetImageOperationModel.Request, completionHandler: @escaping ((Result<GetImageOperationModel.Response, OperationError>) -> Void)) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        guard let imageUrl = self.model.imageUrl, let url = URL(string: imageUrl) else {
            self.noUrlAvailableErrorBlock()
            return
        }
        
        self.task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.successBlock(response: GetImageOperationModel.Response(image: UIImage(data: data)))
            } else {
                self.noDataAvailableErrorBlock()
            }
        }
        self.task?.resume()
    }
    
    override func cancel() {
        self.task?.cancel()
        super.cancel()
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetImageOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
        self.completeOperation()
    }
    
    // MARK: - Operation errors
    
    private func noUrlAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noUrlAvailable))
        self.completeOperation()
    }
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
