//
//  STPhotoDetailsEntityCellInterfaceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class STPhotoDetailsEntityCellInterfaceSpy: NSObject, STPhotoDetailsEntityCellInterface {
    var setImageCalled: Bool = false
    var setTitleCalled: Bool = false
    var setNameCalled: Bool = false
    var setIsLoadingCalled: Bool = false
    
    func setImage(image: UIImage?) {
        self.setImageCalled = true
    }
    
    func setTitle(title: String) {
        self.setTitleCalled = true
    }
    
    func setName(name: String) {
        self.setNameCalled = true
    }
    
    func setIsLoading(isLoading: Bool) {
        self.setIsLoadingCalled = true
    }
}
