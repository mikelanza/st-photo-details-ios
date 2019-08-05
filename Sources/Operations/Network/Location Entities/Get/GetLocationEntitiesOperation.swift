//
//  GetLocationEntitiesOperation.swift
//  STPhotoDetails-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation
import STPhotoCore

class GetLocationEntitiesOperation: AsynchronousOperation {
    private let model: GetLocationEntitiesOperationModel.Request
    private var operationCompletionHandler: (Result<GetLocationEntitiesOperationModel.Response, OperationError>) -> Void
    
    private var task: URLSessionDataTask?
    
    init(model: GetLocationEntitiesOperationModel.Request, completionHandler: @escaping (Result<GetLocationEntitiesOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        let request = GetLocationEntitiesOperationRequestBuilder(model: self.model).request()
        
        self.task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.verifyData(data: data)
        }
        self.task?.resume()
    }
    
    override func cancel() {
        self.task?.cancel()
        super.cancel()
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
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                self.parseJson(json: json)
            } else {
                self.cannotParseResponseErrorBlock()
            }
        } catch {
            self.cannotParseResponseErrorBlock()
        }
    }
    
    private func parseJson(json: NSDictionary) {
        GetLocationEntitiesOperationParseBuilder(dictionary: json, completionHandler: { (parseResult) in
            switch parseResult {
                case .success(let value): self.operationCompletionHandler(Result.success(value)); break
                case .failure(_): self.operationCompletionHandler(Result.failure(OperationError.cannotParseResponse)); break
            }
            self.completeOperation()
        }).parseResponse()
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
