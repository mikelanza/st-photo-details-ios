//
//  PhotoServiceProtocol.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

protocol PhotoServiceProtocol {
    func fetchPhoto(photoId: String, completionHandler: @escaping (Result<STPhoto, OperationError>) -> Void)
}
