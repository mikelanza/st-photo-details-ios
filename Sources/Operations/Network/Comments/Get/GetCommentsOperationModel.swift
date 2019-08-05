//
//  GetCommentsOperationModel.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

enum GetCommentsOperationModel {
    struct Request {
        let photoId: String
        let limit: Int
        let page: Int
    }
    
    struct Response: Codable {
        var comments: [STComment] = []
        var currentPage: Int = 0
        var totalPages: Int = 0
        var totalItems: Int = 0
                
        init(comments: [STComment]) {
            self.comments = comments
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.comments = try container.decodeWrapper(key: .comments, defaultValue: [])
            self.currentPage = try container.decodeWrapper(key: .currentPage, defaultValue: 0)
            self.totalPages = try container.decodeWrapper(key: .totalPages, defaultValue: 0)
            self.totalItems = try container.decodeWrapper(key: .totalItems, defaultValue: 0)
        }
    }
}
