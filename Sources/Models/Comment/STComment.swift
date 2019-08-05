//
//  STComment.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

struct STComment: Codable {
    var id: String
    var createdAt: Date
    
    var user: STUser?
    var photoId: String?
    var text: String = ""
    
    init(id: String) {
        self.init(id: id, createdAt: Date())
    }
    
    init(id: String, createdAt: Date) {
        self.id = id
        self.createdAt = createdAt
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case createdAt = "createdAt"
        case user = "user"
        case photoId = "photoId"
        case text = "text"
    }
}
