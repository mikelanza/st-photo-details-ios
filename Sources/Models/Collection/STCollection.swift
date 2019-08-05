//
//  STCollection.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 29/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

struct STCollection: Codable {
    var id: String
    
    var name: String = ""
    
    init(id: String, name: String = "") {
        self.id = id
        self.name = name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decodeWrapper(key: .name, defaultValue: "")
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "objectId"
        case name = "name"
    }
}
