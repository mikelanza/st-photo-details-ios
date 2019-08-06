//
//  STPhotoCommentsInteractorTests.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 30/07/2019.
//  Copyright (c) 2019 Streetography. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import STPhotoDetails
import XCTest

class STPhotoCommentsInteractorTests: XCTestCase {
    var sut: STPhotoCommentsInteractor!
    var presenterSpy: STPhotoCommentsPresentationLogicSpy!
    var workerSpy: STPhotoCommentsWorkerSpy!
    
    // MARK: - Test lifecycle
  
    override func setUp() {
        super.setUp()
        self.setupSTPhotoCommentsInteractor()
    }
  
    override func tearDown() {
        super.tearDown()
    }
  
    // MARK: - Test setup
  
    func setupSTPhotoCommentsInteractor() {
        self.sut = STPhotoCommentsInteractor()
        
        self.presenterSpy = STPhotoCommentsPresentationLogicSpy()
        self.sut.presenter = self.presenterSpy
        
        self.workerSpy = STPhotoCommentsWorkerSpy(delegate: self.sut)
        self.sut.worker = self.workerSpy
    }
    
    // MARK: - Tests
  
    func testSetPhotoIdShouldUpdatePhotoId() {
        self.sut.photoId = "photoId"
        
        let photoId = "newPhotoId"
        self.sut.setPhotoId(id: photoId)
        XCTAssertEqual(self.sut.photoId, photoId)
    }
    
    func testShouldFetchPhotoCommentsShouldAskThePresenterToPresentWillFetchPhotoCommentsWhenThereAreCommentsToLoad() {
        self.sut.paginationModel.noMoreItems = false
        self.sut.paginationModel.isFetchingItems = false
        self.sut.shouldFetchPhotoComments()
        XCTAssertTrue(self.presenterSpy.presentWillFetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldNotAskThePresenterToPresentWillFetchPhotoCommentsWhenThereAreNoMoreCommentsToLoad() {
        self.sut.paginationModel.noMoreItems = true
        self.sut.shouldFetchPhotoComments()
        XCTAssertFalse(self.presenterSpy.presentWillFetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldNotAskThePresenterToPresentWillFetchPhotoCommentsWhenCommentsAreAlreadyBeingFetched() {
        self.sut.paginationModel.isFetchingItems = true
        self.sut.shouldFetchPhotoComments()
        XCTAssertFalse(self.presenterSpy.presentWillFetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldAskTheWorkerToFetchPhotoCommentsWhenThereAreCommentsToLoad() {
        self.sut.paginationModel.noMoreItems = false
        self.sut.paginationModel.isFetchingItems = false
        self.sut.shouldFetchPhotoComments()
        XCTAssertTrue(self.workerSpy.fetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldNotAskTheWorkerToFetchPhotoCommentsWhenThereAreNoMoreCommentsToLoad() {
        self.sut.paginationModel.noMoreItems = true
        self.sut.shouldFetchPhotoComments()
        XCTAssertFalse(self.workerSpy.fetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldNotAskTheWorkerToFetchPhotoCommentsWhenCommentsAreAlreadyBeingFetched() {
        self.sut.paginationModel.isFetchingItems = true
        self.sut.shouldFetchPhotoComments()
        XCTAssertFalse(self.workerSpy.fetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldAskThePresenterToPresentPhotoComments() {
        self.sut.shouldFetchPhotoComments()
        XCTAssertTrue(self.presenterSpy.presentPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldUpdatePaginationModelCurrentPageAndIsFetchingItems() {
        let page = 2
        self.sut.paginationModel.currentPage = page
        self.sut.shouldFetchPhotoComments()
        XCTAssertEqual(self.sut.paginationModel.currentPage, page + 1)
        XCTAssertFalse(self.sut.paginationModel.isFetchingItems)
    }
    
    func testShouldFetchPhotoCommentsShouldUpdateComments() {
        let count = self.sut.comments.count
        let comments = [STComment(id: "commentId")]
        self.workerSpy.comments = comments
        self.sut.shouldFetchPhotoComments()
        XCTAssertEqual(self.sut.comments.count, count + comments.count)
    }
    
    func testShouldFetchPhotoCommentsShouldNotUpdatePaginationModelNoMoreItemsWhenLimitIsNotReached() {
        var comments: [STComment] = []
        for _ in 0..<50 {
            comments.append(STComment(id: "id"))
        }
        self.workerSpy.comments = comments
        self.sut.shouldFetchPhotoComments()
        XCTAssertFalse(self.sut.paginationModel.noMoreItems)
    }
    
    func testShouldFetchPhotoCommentsShouldUpdatePaginationModelNoMoreItemsWhenLimitIsReached() {
        self.workerSpy.comments = [STComment(id: "commentId")]
        self.sut.shouldFetchPhotoComments()
        XCTAssertTrue(self.sut.paginationModel.noMoreItems)
    }
    
    func testShouldFetchPhotoCommentsShouldAskThePresenterToPresentDidFetchPhotoCommentsWhenLimitIsReached() {
        self.workerSpy.comments = [STComment(id: "commentId")]
        self.sut.shouldFetchPhotoComments()
        XCTAssertTrue(self.presenterSpy.presentDidFetchPhotoCommentsCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldAskThePresenterToPresentEmptyStateWhenThereAreNoComments() {
        self.workerSpy.comments = []
        self.sut.comments = []
        self.sut.shouldFetchPhotoComments()
        XCTAssertTrue(self.presenterSpy.presentEmptyStateCalled)
    }
    
    func testShouldFetchPhotoCommentsShouldNotAskThePresenterToPresentEmptyStateWhenThereAreComments() {
        self.workerSpy.comments = [STComment(id: "commentId")]
        self.sut.comments = []
        self.sut.shouldFetchPhotoComments()
        XCTAssertFalse(self.presenterSpy.presentEmptyStateCalled)
    }
    
    func testShouldFetchAvatarImageShouldAskThePresenterToPresentWillFetchAvatarImageWhenThereIsImageUrlAndNoImage() {
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = nil
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertTrue(self.presenterSpy.presentWillFetchAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldNotAskThePresenterToPresentWillFetchAvatarImageWhenThereIsImageUrlAndImageAndIsLoading() {
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = UIImage()
        displayedComment.isLoadingUserImage = true
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertFalse(self.presenterSpy.presentWillFetchAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldAskTheWorkerToFetchAvatarImageWhenThereIsImageUrlAndNoImageAndIsNotLoading() {
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = nil
        displayedComment.isLoadingUserImage = false
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertTrue(self.workerSpy.fetchAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldNotAskTheWorkerToFetchAvatarImageWhenThereIsImageUrlAndImageAndIsLoading() {
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = UIImage()
        displayedComment.isLoadingUserImage = true
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertFalse(self.workerSpy.fetchAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldAskThePresenterToPresentDidFetchAvatarImageWhenThereIsImageUrlAndNoImage() {
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = nil
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertTrue(self.presenterSpy.presentDidFetchAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldAskThePresenterToPresentAvatarImageWhenThereIsImageUrlAndNoImage() {
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = nil
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertTrue(self.presenterSpy.presentAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldAskThePresenterToPresentDidFetchAvatarImageWhenThereIsImageUrlAndNoImageForFailureCase() {
        self.workerSpy.shouldFailFetchAvatarImage = true
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = nil
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertTrue(self.presenterSpy.presentDidFetchAvatarImageCalled)
    }
    
    func testShouldFetchAvatarImageShouldNotAskThePresenterToPresentAvatarImageWhenThereIsImageUrlAndNoImageForFailureCase() {
        self.workerSpy.shouldFailFetchAvatarImage = true
        let displayedComment = STPhotoComments.DisplayedComment(id: "commentId")
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.avatarImage = nil
        self.sut.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: displayedComment))
        XCTAssertFalse(self.presenterSpy.presentAvatarImageCalled)
    }
}