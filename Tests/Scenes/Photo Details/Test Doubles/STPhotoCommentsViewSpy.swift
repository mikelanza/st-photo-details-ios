//
//  STPhotoCommentsViewSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoCommentsViewSpy: STPhotoCommentsView {
    var displayPhotoCommentCountCalled: Bool = false
    
    override func displayPhotoCommentCount(title: String) {
        self.displayPhotoCommentCountCalled = true
    }
}
