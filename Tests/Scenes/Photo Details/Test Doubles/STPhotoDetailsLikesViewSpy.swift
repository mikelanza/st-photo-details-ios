//
//  STPhotoDetailsLikesViewSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class STPhotoDetailsLikesViewSpy: STPhotoDetailsLikesView {
    var setLikesCalled: Bool = false
    var showLikesCalled: Bool = false
    
    override func setLikes(title: String) {
        self.setLikesCalled = true
    }
    
    override func showLikes() {
        self.showLikesCalled = true
    }
}
