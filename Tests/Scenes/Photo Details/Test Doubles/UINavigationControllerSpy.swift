//
//  UINavigationControllerSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 26/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class UINavigationControllerSpy: UINavigationController {
    var popViewControllerCalled: Bool = false
    
    override func popViewController(animated: Bool) -> UIViewController? {
        self.popViewControllerCalled = true
        return UIViewController()
    }
}
