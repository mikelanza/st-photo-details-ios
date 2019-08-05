//
//  LocationAddressNetworkService.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class LocationAddressNetworkService: LocationAddressServiceProtocol {
    let operationQueue = OperationQueue()
    
    func fetchLocationAddress(location: STLocation, completionHandler: @escaping (Result<STAddress, OperationError>) -> Void) {
        let operation = GetLocationAddressOperation(model: GetLocationAddressOperationModel.Request(location: location)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.address)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
