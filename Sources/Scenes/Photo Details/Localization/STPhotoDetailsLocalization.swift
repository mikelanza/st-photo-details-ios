//
//  STPhotoDetailsLocalization.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 27/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

class STPhotoDetailsLocalization {
    static let shared = STPhotoDetailsLocalization()
    
    private init() {
        
    }
    
    struct LocalizedKey {
        static let
        collectionTitle = "STPhotoDetails.collection.title",
        locationTitle = "STPhotoDetails.location.title",
        blockTitle = "STPhotoDetails.block.title",
        neighborhoodTitle = "STPhotoDetails.neighborhood.title",
        cityTitle = "STPhotoDetails.city.title",
        countyTitle = "STPhotoDetails.county.title",
        stateTitle = "STPhotoDetails.state.title",
        countryTitle = "STPhotoDetails.country.title",
        
        likeCount = "STPhotoDetails.like.count",
        commentCount = "STPhotoDetails.comment.count"
    }
    
    let collectionTitle = LocalizedKey.collectionTitle.localized(in: Bundle.module)
    let locationTitle = LocalizedKey.locationTitle.localized(in: Bundle.module)
    let blockTitle = LocalizedKey.blockTitle.localized(in: Bundle.module)
    let neighborhoodTitle = LocalizedKey.neighborhoodTitle.localized(in: Bundle.module)
    let cityTitle = LocalizedKey.cityTitle.localized(in: Bundle.module)
    let countyTitle = LocalizedKey.countyTitle.localized(in: Bundle.module)
    let stateTitle = LocalizedKey.stateTitle.localized(in: Bundle.module)
    let countryTitle = LocalizedKey.countryTitle.localized(in: Bundle.module)
    
    func likeCountTitle(_ count: Int) -> String {
        return String.localizedStringWithFormat(LocalizedKey.likeCount.localized(in: Bundle.module), count)
    }
    
    func commentCountTitle(_ count: Int) -> String {
        return String.localizedStringWithFormat(LocalizedKey.commentCount.localized(in: Bundle.module), count)
    }
}
