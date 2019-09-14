//
//  LocationAddressLocalTaskSpy.swift
//  STPhotoDetailsTests-iOS
//
//  Created by Dimitri Strauneanu on 14/09/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class LocationAddressLocalTaskSpy: LocationAddressLocalTask {
    var address: STAddress = STAddress()
    var fetchLocationAddressCalled: Bool = false
    var shouldFailFetchLocationAddress: Bool = false
    
    override func fetchLocationAddress(location: STLocation, completionHandler: @escaping (Result<STAddress, OperationError>) -> Void) {
        self.fetchLocationAddressCalled = true
        
        if self.shouldFailFetchLocationAddress {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(self.address))
        }
    }
}
