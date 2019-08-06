//
//  STPhotoDetailsViewControllerSpy.swift
//  STPhotoDetails-iOS
//
//  Created by Dimitri Strauneanu on 06/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

@testable import STPhotoDetails

class STPhotoDetailsViewControllerSpy: STPhotoDetailsViewController {
    var dismissCalled: Bool = false
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        self.dismissCalled = true
    }
}
