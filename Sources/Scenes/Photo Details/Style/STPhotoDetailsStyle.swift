//
//  STPhotoDetailsStyle.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 26/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

class STPhotoDetailsStyle {
    static let shared = STPhotoDetailsStyle()
    
    var photoLikesViewModel: PhotoLikesViewModel
    
    var photoDetailsCellModel: PhotoDetailsCellModel
    var photoEntityCellModel: PhotoEntityCellModel
    
    private init() {
        self.photoLikesViewModel = PhotoLikesViewModel()
        self.photoDetailsCellModel = PhotoDetailsCellModel()
        self.photoEntityCellModel = PhotoEntityCellModel()
    }
    
    struct PhotoLikesViewModel {
        var backButtonImage: UIImage = UIImage(named: "back_arrow_circle", in: Bundle.module, compatibleWith: nil)!
        var likesButtonImage: UIImage = UIImage(named: "white_heart", in: Bundle.module, compatibleWith: nil)!
        var likesButtonBackgroundColor: UIColor = UIColor(red: 54/255, green: 62/255, blue: 75/255, alpha: 1)
        var likesButtonTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
    }
    
    struct PhotoEntityCellModel {
        var collectionImage: UIImage = UIImage(named: "collection_gray", in: Bundle.module, compatibleWith: nil)!
        var locationImage: UIImage = UIImage(named: "location_gray", in: Bundle.module, compatibleWith: nil)!
        var blockImage: UIImage = UIImage(named: "block_gray", in: Bundle.module, compatibleWith: nil)!
        var neighborhoodImage: UIImage = UIImage(named: "neighborhood_gray", in: Bundle.module, compatibleWith: nil)!
        var cityImage: UIImage = UIImage(named: "city_gray", in: Bundle.module, compatibleWith: nil)!
        var countyImage: UIImage = UIImage(named: "county_gray", in: Bundle.module, compatibleWith: nil)!
        var stateImage: UIImage = UIImage(named: "state_gray", in: Bundle.module, compatibleWith: nil)!
        var countryImage: UIImage = UIImage(named: "country_gray", in: Bundle.module, compatibleWith: nil)!
        
        var titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor: UIColor(hexString: "1D305C")
        ]
        
        var nameAttributes: [NSAttributedString.Key: Any] {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right
            paragraphStyle.lineBreakMode = .byTruncatingTail
            return [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                NSAttributedString.Key.foregroundColor: UIColor(hexString: "747E9A"),
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
        }
        
        var backgroundColor: UIColor = UIColor(red: 179/255, green: 187/255, blue: 206/255, alpha: 0.05)
        var separatorColor: UIColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.3)
    }
    
    struct PhotoDetailsCellModel {
        var avatarPlaceholderImage: UIImage = UIImage(named: "avatar", in: Bundle.module, compatibleWith: nil)!
        
        var nameAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor(red: 29/255, green: 48/255, blue: 92/255, alpha: 1.0)
        ]
        
        var timeAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor: UIColor(red: 213/255, green: 215/255, blue: 222/255, alpha: 1.0)
        ]
        
        var descriptionAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
        ]
        
        var separatorColor: UIColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.3)
    }
}
