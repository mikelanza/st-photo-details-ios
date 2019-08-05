//
//  STPhotoCommentsBusinessLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class STPhotoCommentsBusinessLogicSpy: STPhotoCommentsBusinessLogic {
    var setPhotoIdCalled: Bool = false
    var shouldFetchPhotoCommentsCalled: Bool = false
    var shouldFetchAvatarImageCalled: Bool = false
    
    func setPhotoId(id: String) {
        self.setPhotoIdCalled = true
    }
    
    func shouldFetchPhotoComments() {
        self.shouldFetchPhotoCommentsCalled = true
    }
    
    func shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request) {
        self.shouldFetchAvatarImageCalled = true
    }
}
