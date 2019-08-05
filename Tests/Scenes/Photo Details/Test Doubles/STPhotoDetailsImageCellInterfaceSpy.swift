//
//  STPhotoDetailsImageCellInterfaceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class STPhotoDetailsImageCellInterfaceSpy: NSObject, STPhotoDetailsImageCellInterface {
    var setIsLoadingCalled: Bool = false
    var setBackgroundImageColorCalled: Bool = false
    var setImageCalled: Bool = false
    
    func setIsLoading(isLoading: Bool) {
        self.setIsLoadingCalled = true
    }
    
    func setBackgroundImageColor(color: UIColor?) {
        self.setBackgroundImageColorCalled = true
    }
    
    func setImage(image: UIImage?) {
        self.setImageCalled = true
    }
}
