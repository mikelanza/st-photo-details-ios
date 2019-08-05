//
//  UITableViewSpy.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 26/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import UIKit

class UITableViewSpy: UITableView {
    var reloadDataCalled: Bool = false
    var performBatchUpdatesCalled: Bool = false
    var insertRowsCalled: Bool = false
    
    override func reloadData() {
        self.reloadDataCalled = true
        super.reloadData()
    }
    
    override func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        self.performBatchUpdatesCalled = true
        super.performBatchUpdates(updates, completion: completion)
    }
    
    override func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
        self.insertRowsCalled = true
        super.insertRows(at: indexPaths, with: animation)
    }
}
