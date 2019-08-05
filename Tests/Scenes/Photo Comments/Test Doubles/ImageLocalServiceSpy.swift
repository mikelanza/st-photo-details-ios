//
//  ImageLocalServiceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit
import STPhotoCore

class ImageLocalServiceSpy: ImageLocalService {
    var image: UIImage?
    var fetchImageCalled: Bool = false
    var shouldFailFetchImage: Bool = false
    
    override func fetchImage(url: String?, completionHandler: @escaping (Result<UIImage?, OperationError>) -> Void) {
        self.fetchImageCalled = true
        
        if self.shouldFailFetchImage {
            completionHandler(Result.failure(OperationError.noDataAvailable))
        } else {
            completionHandler(Result.success(self.image))
        }
    }
}
