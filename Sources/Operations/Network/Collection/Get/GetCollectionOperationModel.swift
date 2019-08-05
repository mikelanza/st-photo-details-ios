//
//  GetCollectionOperationModel.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

enum GetCollectionOperationModel {
    struct Request {
        let collectionId: String
    }
    
    struct Response: Codable {
        let collection: STCollection
    }
}
