//
//  GetLocationAddressLocalOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class GetLocationAddressLocalOperation: AsynchronousOperation {
    private let model: GetLocationAddressOperationModel.Request
    private var operationCompletionHandler: (Result<GetLocationAddressOperationModel.Response, OperationError>) -> Void
    
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1...3)
    
    init(model: GetLocationAddressOperationModel.Request, completionHandler: @escaping (Result<GetLocationAddressOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(self.delay)) {
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                self.successfulResultBlock(address: self.address())
            }
        }
    }
    
    private func address() -> STAddress {
        var address = STAddress()
        address.location = self.model.location
        address.street = "Street"
        address.city = "Iasi"
        address.state = "Texas"
        address.country = "Romania"
        return address
    }
    
    // MARK: - Successful result
    
    private func successfulResultBlock(address: STAddress) {
        self.operationCompletionHandler(Result.success(GetLocationAddressOperationModel.Response(address: address)))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
