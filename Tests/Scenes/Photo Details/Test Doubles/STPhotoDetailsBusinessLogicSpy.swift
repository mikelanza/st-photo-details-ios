//
//  STPhotoDetailsBusinessLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoDetailsBusinessLogicSpy: STPhotoDetailsBusinessLogic {
    var setPhotoIdCalled: Bool = false
    var shouldFetchPhotoCalled: Bool = false
    
    func setPhotoId(id: String) {
        self.setPhotoIdCalled = true
    }
    
    func shouldFetchPhoto() {
        self.shouldFetchPhotoCalled = true
    }
}
