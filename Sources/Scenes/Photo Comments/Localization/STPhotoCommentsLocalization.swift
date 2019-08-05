//
//  STPhotoCommentsLocalization.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

class STPhotoCommentsLocalization {
    static let shared = STPhotoCommentsLocalization()
    
    private init() {
        
    }
    
    struct LocalizedKey {
        static let
        emptyStateText = "STPhotoComments.empty.state.text"
    }
    
    let emptyStateText = LocalizedKey.emptyStateText.localized(in: Bundle.module)
}
