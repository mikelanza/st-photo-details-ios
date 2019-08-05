//
//  GetLocationEntitiesOperationModel.swift
//  STPhotoDetails-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation
import STPhotoCore

enum GetLocationEntitiesOperationModel {
    struct Request {
        let location: STLocation
        var entities: [EntityLevel] = [EntityLevel.block, EntityLevel.neighborhood, EntityLevel.city, EntityLevel.county, EntityLevel.state, EntityLevel.country]
        var shouldContainGeometry: Bool = false
        
        init(location: STLocation) {
            self.location = location
        }
    }
    
    struct Response {
        let entities: [EntityLevel: GeoEntity]
    }
}
