//
//  UIButtonSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class UIButtonSpy: UIButton {
    var setAttributedTitleCalled: Bool = false
    
    override func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) {
        self.setAttributedTitleCalled = true
    }
}
