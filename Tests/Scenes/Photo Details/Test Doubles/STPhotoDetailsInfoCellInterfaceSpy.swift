//
//  STPhotoDetailsInfoCellInterfaceSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class STPhotoDetailsInfoCellInterfaceSpy: NSObject, STPhotoDetailsInfoCellInterface {
    var setAvatarImageCalled: Bool = false
    var setNameCalled: Bool = false
    var setTimeCalled: Bool = false
    var setDescriptionCalled: Bool = false
    var setIsLoadingUserAvatarCalled: Bool = false
    
    func setAvatarImage(image: UIImage?) {
        self.setAvatarImageCalled = true
    }
    
    func setName(name: String) {
        self.setNameCalled = true
    }
    
    func setTime(time: String) {
        self.setTimeCalled = true
    }
    
    func setDescription(description: String) {
        self.setDescriptionCalled = true
    }
    
    func setIsLoadingUserAvatar(isLoading: Bool) {
        self.setIsLoadingUserAvatarCalled = true
    }
}
