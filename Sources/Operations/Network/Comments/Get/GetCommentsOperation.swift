//
//  GetCommentsOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class GetCommentsOperation: AsynchronousOperation {
    private let model: GetCommentsOperationModel.Request
    private var operationCompletionHandler: (Result<GetCommentsOperationModel.Response, OperationError>) -> Void
    
    private var task: URLSessionDataTask?
    
    init(model: GetCommentsOperationModel.Request, completionHandler: @escaping (Result<GetCommentsOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        let request = GetCommentsOperationRequestBuilder(model: self.model).request()
        
        self.task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.verifyData(data: data)
        }
        self.task?.resume()
    }
    
    private func verifyData(data: Data?) {
        if let data = data {
            self.decodeData(data: data)
        } else {
            self.noDataAvailableErrorBlock()
        }
    }
    
    private func decodeData(data: Data) {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
            let response = try decoder.decode(GetCommentsOperationModel.Response.self, from: data)
            self.successBlock(response: response)
        } catch let error {
            print("Parsing error: \(error)")
            self.cannotParseResponseErrorBlock()
        }
    }
    
    override func cancel() {
        self.task?.cancel()
        super.cancel()
    }
    
    private func shouldCancelOperation() -> Bool {
        if self.isCancelled {
            self.operationCompletionHandler(Result.failure(OperationError.operationCancelled))
            self.completeOperation()
            return true
        }
        return false
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetCommentsOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
        self.completeOperation()
    }
    
    // MARK: - Operation errors
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
    
    private func cannotParseResponseErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.cannotParseResponse))
        self.completeOperation()
    }
}
