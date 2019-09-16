//
//  STPhotoCommentsModels.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 30/07/2019.
//  Copyright (c) 2019 Streetography. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import STPhotoCore

enum STPhotoComments {
    struct PaginationModel {
        var isFetchingItems: Bool = false
        var noMoreItems: Bool = false
        var limit: Int = 30
        var currentPage: Int = 0
        
        mutating func reset() {
            self.isFetchingItems = false
            self.noMoreItems = false
            self.currentPage = 0
        }
    }
    
    class DisplayedComment {
        var id: String
        var name: String = ""
        var text: String = ""
        var time: String = ""
        
        var avatarImageUrl: String?
        var avatarImage: UIImage?
        var isLoadingUserImage: Bool = false
        
        weak var cellInterface: STPhotoCommentsViewCellInterface?
        
        init(id: String) {
            self.id = id
        }
    }
    
    struct PresentComments {
        struct Response {
            let comments: [STComment]
            let avatarImageSize: CGSize
        }
        
        struct ViewModel {
            let items: [DisplayedComment]
        }
    }
    
    struct FetchAvatarImage {
        struct Request {
            let displayedComment: DisplayedComment
        }
        
        struct Response {
            let displayedComment: DisplayedComment
        }
        
        struct ViewModel {
            let displayedComment: DisplayedComment
        }
    }
    
    struct PresentAvatarImage {
        struct Response {
            let displayedComment: DisplayedComment
            let image: UIImage?
        }
        
        struct ViewModel {
            let displayedComment: DisplayedComment
            let image: UIImage?
        }
    }
}
