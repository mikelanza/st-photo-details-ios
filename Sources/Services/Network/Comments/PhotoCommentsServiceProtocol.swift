//
//  PhotoCommentsServiceProtocol.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

protocol PhotoCommentsServiceProtocol {
    func fetchPhotoComments(photoId: String, page: Int, limit: Int, completionHandler: @escaping (Result<[STComment], OperationError>) -> Void)
}
