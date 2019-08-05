//
//  STPhotoCommentsInteractor.swift
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

protocol STPhotoCommentsBusinessLogic {
    func setPhotoId(id: String)
    func shouldFetchPhotoComments()
    func shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request)
}

class STPhotoCommentsInteractor: STPhotoCommentsBusinessLogic {
    var presenter: STPhotoCommentsPresentationLogic?
    var worker: STPhotoCommentsWorker?
    
    var photoId: String = ""
    var comments: [STComment] = []
    var paginationModel: STPhotoComments.PaginationModel
    
    init() {
        self.paginationModel = STPhotoComments.PaginationModel()
        self.worker = STPhotoCommentsWorker(delegate: self)
    }
    
    func setPhotoId(id: String) {
        self.photoId = id
    }
    
    func shouldFetchPhotoComments() {
        if self.paginationModel.noMoreItems || self.paginationModel.isFetchingItems {
            return
        }
        
        self.paginationModel.isFetchingItems = true
        self.presenter?.presentWillFetchPhotoComments()
        self.worker?.fetchPhotoComments(photoId: self.photoId, page: self.paginationModel.currentPage, limit: self.paginationModel.limit)
    }
    
    func shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request) {
        if request.displayedComment.avatarImage == nil && !request.displayedComment.isLoadingUserImage {
            self.presenter?.presentWillFetchAvatarImage(response: STPhotoComments.FetchAvatarImage.Response(displayedComment: request.displayedComment))
            self.worker?.fetchAvatarImage(displayedComment: request.displayedComment)
        }
    }
}

extension STPhotoCommentsInteractor {
    private func avatarImageSize() -> CGSize {
        let side: CGFloat = 50 * UIScreen.main.scale
        return CGSize(width: side, height: side)
    }
    
    private func verifyLastPageOfComments(commentCount: Int) {
        guard commentCount < self.paginationModel.limit else {
            return
        }
        self.paginationModel.noMoreItems = true
        self.presenter?.presentDidFetchPhotoComments()
        self.presentEmptyStateIfNeeded(commentCount: commentCount)
    }
    
    private func presentEmptyStateIfNeeded(commentCount: Int) {
        if self.comments.count == 0 && commentCount == 0 {
            self.presenter?.presentEmptyState()
        }
    }
}

extension STPhotoCommentsInteractor: STPhotoCommentsWorkerDelegate {
    func successDidFetchPhotoComments(comments: [STComment]) {
        self.comments.append(contentsOf: comments)
        self.presenter?.presentPhotoComments(response: STPhotoComments.PresentComments.Response(comments: comments, avatarImageSize: self.avatarImageSize()))
        self.paginationModel.currentPage += 1
        self.paginationModel.isFetchingItems = false
        self.verifyLastPageOfComments(commentCount: comments.count)
    }
    
    func failureDidFetchPhotoComments(error: OperationError) {
        
    }
    
    func successDidFetchAvatarImage(image: UIImage?, displayedComment: STPhotoComments.DisplayedComment) {
        self.presenter?.presentDidFetchAvatarImage(response: STPhotoComments.FetchAvatarImage.Response(displayedComment: displayedComment))
        self.presenter?.presentAvatarImage(response: STPhotoComments.PresentAvatarImage.Response(displayedComment: displayedComment, image: image))
    }
    
    func failureDidFetchAvatarImage(displayedComment: STPhotoComments.DisplayedComment, error: OperationError) {
        self.presenter?.presentDidFetchAvatarImage(response: STPhotoComments.FetchAvatarImage.Response(displayedComment: displayedComment))
    }
}
