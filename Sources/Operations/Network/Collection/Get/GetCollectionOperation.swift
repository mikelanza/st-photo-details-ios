//
//  GetCollectionOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class GetCollectionOperation: AsynchronousOperation {
    private let model: GetCollectionOperationModel.Request
    private var operationCompletionHandler: (Result<GetCollectionOperationModel.Response, OperationError>) -> Void
    
    private var task: URLSessionDataTask?
    
    init(model: GetCollectionOperationModel.Request, completionHandler: @escaping (Result<GetCollectionOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        let request = GetCollectionOperationRequestBuilder(model: self.model).request()
        self.task = URLSession.shared.dataTask(with: request, completionHandler: { (data, _, _) in
            self.verifyData(data: data)
        })
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
            let response = try decoder.decode(GetCollectionOperationModel.Response.self, from: data)
            self.successfulResultBlock(value: response)
        } catch {
            self.cannotParseResponseErrorBlock()
        }
    }
    
    override func cancel() {
        self.task?.cancel()
        super.cancel()
    }
    
    // MARK: - Successful result
    
    private func successfulResultBlock(value: GetCollectionOperationModel.Response) {
        self.operationCompletionHandler(Result.success(value))
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
