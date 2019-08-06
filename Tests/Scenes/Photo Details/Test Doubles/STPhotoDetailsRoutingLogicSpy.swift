//
//  STPhotoDetailsRoutingLogicSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 26/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import Foundation

class STPhotoDetailsRoutingLogicSpy: NSObject, STPhotoDetailsRoutingLogic {
    var removeViewControllerCalled: Bool = false
        
    func removeViewController() {
        self.removeViewControllerCalled = true
    }
}
