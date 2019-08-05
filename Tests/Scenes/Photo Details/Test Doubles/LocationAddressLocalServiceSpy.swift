//
//  LocationAddressLocalServiceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class LocationAddressLocalServiceSpy: LocationAddressLocalService {
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
