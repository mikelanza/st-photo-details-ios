//
//  LocationEntitiesLocalServiceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import STPhotoCore

class LocationEntitiesLocalServiceSpy: LocationEntitiesLocalService {
    var fetchPhotoEntitiesCalled: Bool = false
    var shouldFailFetchPhotoEntities: Bool = false
    
    override func fetchPhotoEntities(location: STLocation, completionHandler: @escaping (Result<[EntityLevel : GeoEntity], OperationError>) -> Void) {
        self.fetchPhotoEntitiesCalled = true
        
        if self.shouldFailFetchPhotoEntities {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success([:]))
        }
    }
}
