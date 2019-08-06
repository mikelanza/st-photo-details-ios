//
//  STPhotoDetailsRouterTests.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 26/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import XCTest

class STPhotoDetailsRouterTests: XCTestCase {
    var sut: STPhotoDetailsRouter!
    var viewController: STPhotoDetailsViewControllerSpy!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.setupSTPhotoDetailsRouter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func setupSTPhotoDetailsRouter() {
        self.sut = STPhotoDetailsRouter()
        
        self.viewController = STPhotoDetailsViewControllerSpy(photoId: "photoId")
        self.sut.viewController = self.viewController
    }
    
    // MARK: - Tests
    
    func testRemoveViewControllerWhenThereIsNavigationController() {
        let navigationControllerSpy = UINavigationControllerSpy(rootViewController: self.sut.viewController!)
        self.sut.removeViewController()
        XCTAssertTrue(navigationControllerSpy.popViewControllerCalled)
    }
    
    func testRemoveViewControllerWhenThereIsNoNavigationController() {
        self.sut.removeViewController()
        XCTAssertTrue(self.viewController.dismissCalled)
    }
}
