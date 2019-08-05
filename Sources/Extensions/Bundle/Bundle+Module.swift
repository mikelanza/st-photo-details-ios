//
//  Bundle+Module.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 27/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

extension Bundle {
    private class STPhotoDetailsModule { }
    
    static var module: Bundle {
        let bundle = Bundle(for: STPhotoDetailsModule.self)
        guard let url = bundle.url(forResource: "STPhotoDetails", withExtension: "bundle") else { return bundle }
        return Bundle(url: url) ?? bundle
    }
}
