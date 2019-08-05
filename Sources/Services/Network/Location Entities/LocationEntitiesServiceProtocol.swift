//
//  LocationEntitiesServiceProtocol.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

protocol LocationEntitiesServiceProtocol {
    func fetchPhotoEntities(location: STLocation, completionHandler: @escaping (Result<[EntityLevel: GeoEntity], OperationError>) -> Void)
}
