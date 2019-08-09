//
//  STPhotoCommentsStyle.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 31/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

class STPhotoCommentsStyle {
    static let shared = STPhotoCommentsStyle()
    
    var emptyViewModel: EmptyViewModel
    var commentsViewModel: CommentsViewModel
    var commentsViewCellModel: CommentsViewCellModel
    
    private init() {
        self.emptyViewModel = EmptyViewModel()
        self.commentsViewModel = CommentsViewModel()
        self.commentsViewCellModel = CommentsViewCellModel()
    }
    
    struct EmptyViewModel {
        var image: UIImage = UIImage(named: "st_photo_details_comments_light", in: Bundle.module, compatibleWith: nil)!
        var titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ]
    }
    
    struct CommentsViewModel {
        struct State {
            let image: UIImage
            let borderColor: UIColor
            let textAttributes: [NSAttributedString.Key: Any]
        }
        
        var commentsButtonExpandedState: State {
            let image = UIImage(named: "st_photo_details_comments_dark", in: Bundle.module, compatibleWith: nil)!
            let borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.3)
            let textAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                NSAttributedString.Key.foregroundColor: UIColor(red: 54/255, green: 62/255, blue: 75/255, alpha: 1)
            ]
            return State(image: image, borderColor: borderColor, textAttributes: textAttributes)
        }
        
        var commentsButtonContractedState: State {
            let image = UIImage(named: "st_photo_details_comments_light", in: Bundle.module, compatibleWith: nil)!
            let borderColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 0.3)
            let textAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                NSAttributedString.Key.foregroundColor: UIColor.lightGray
            ]
            return State(image: image, borderColor: borderColor, textAttributes: textAttributes)
        }
        
        var expandedAccessoryImage: UIImage = UIImage(named: "st_photo_details_dark_arrow_up", in: Bundle.module, compatibleWith: nil)!
        var contractedAccessoryImage: UIImage = UIImage(named: "st_photo_details_light_arrow_down", in: Bundle.module, compatibleWith: nil)!
    }
    
    struct CommentsViewCellModel {
        var avatarPlaceholderImage: UIImage = UIImage(named: "st_photo_details_avatar", in: Bundle.module, compatibleWith: nil)!
        
        var separatorColor: UIColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        
        var nameAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 24/255, blue: 64/255, alpha: 1.0)
        ]
        
        var timeAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
            NSAttributedString.Key.foregroundColor: UIColor(red: 180/255, green: 180/255, blue: 180/255, alpha: 1.0)
        ]
        
        var commentAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor(red: 83/255, green: 91/255, blue: 113/255, alpha: 1.0)
        ]
    }
}
