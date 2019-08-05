//
//  LocationEntitiesLocalService.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class LocationEntitiesLocalService: LocationEntitiesServiceProtocol {
    let operationQueue = OperationQueue()
    
    func fetchPhotoEntities(location: STLocation, completionHandler: @escaping (Result<[EntityLevel : GeoEntity], OperationError>) -> Void) {
        let operation = GetLocationEntitiesLocalOperation(model: GetLocationEntitiesOperationModel.Request(location: location)) { result in
            switch result {
                case .success(let value): completionHandler(Result.success(value.entities)); break
                case .failure(let error): completionHandler(Result.failure(error)); break
            }
        }
        self.operationQueue.addOperation(operation)
    }
}
