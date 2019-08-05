//
//  GetLocationAddressOperationModel.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

struct GetLocationAddressOperationModel {
    struct Request {
        let location: STLocation
    }
    
    struct Response {
        let address: STAddress
    }
}
