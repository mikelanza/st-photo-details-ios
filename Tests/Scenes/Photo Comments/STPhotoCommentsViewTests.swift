//
//  STPhotoCommentsViewTests.swift
//  STPhotoDetailsTests
//
//  Created by Dimitri Strauneanu on 30/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

@testable import STPhotoDetails
import XCTest

class STPhotoCommentsViewTests: XCTestCase {
    var sut: STPhotoCommentsView!
    var interactorSpy: STPhotoCommentsBusinessLogicSpy!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override class func setUp() {
        super.setUp()
    }
    
    override func setUp() {
        super.setUp()
        self.window = UIWindow()
        self.setupSTPhotoCommentsView()
    }
    
    override func tearDown() {
        self.window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    private func setupSTPhotoCommentsView() {
        self.sut = STPhotoCommentsView(photoId: "photoId")
        self.sut.translatesAutoresizingMaskIntoConstraints = false
        
        self.interactorSpy = STPhotoCommentsBusinessLogicSpy()
        self.sut.interactor = self.interactorSpy
    }
    
    private func setupSTPhotoCommentsViewConstraints() {
        NSLayoutConstraint.activate([
            self.sut.bottomAnchor.constraint(equalTo: self.window.bottomAnchor),
            self.sut.leadingAnchor.constraint(equalTo: self.window.leadingAnchor),
            self.sut.trailingAnchor.constraint(equalTo: self.window.trailingAnchor)
        ])
    }
    
    private func loadView() {
        self.window.addSubview(self.sut)
        self.setupSTPhotoCommentsViewConstraints()
        RunLoop.current.run(until: Date())
    }
    
    private func waitForMainQueue() {
        let waitExpectation = expectation(description: "Waiting for main queue.")
        DispatchQueue.main.async {
            waitExpectation.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }
    
    // MARK: - Subviews tests
    
    func testIfViewConformsToUITableViewDataSourceProtocol() {
        self.loadView()
        XCTAssertTrue(self.sut.conforms(to: UITableViewDataSource.self))
    }
    
    func testIfViewHasSetUITableViewDataSource() {
        self.loadView()
        XCTAssertNotNil(self.sut.tableView.dataSource)
    }
    
    func testIfViewConformsToUITableViewDelegateProtocol() {
        self.loadView()
        XCTAssertTrue(self.sut.conforms(to: UITableViewDelegate.self))
    }
    
    func testIfViewHasSetUITableViewDelegate() {
        self.loadView()
        XCTAssertNotNil(self.sut.tableView.delegate)
    }
    
    func testNumberOfRowsInAnySectionShouldEqualItemCount() {
        self.sut.displayedComments = [STPhotoComments.DisplayedComment(id: "id")]
        let numberOfRows = self.sut.tableView(self.sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, self.sut.displayedComments.count)
    }

    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {
        let tableView = self.sut.tableView
        let numberOfSections = self.sut.numberOfSections(in: tableView!)
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testCellForRowShouldReturnCorrectCellForDisplayedComment() {
        self.loadView()
        self.sut.displayedComments = [STPhotoComments.DisplayedComment(id: "id")]
        let tableView = self.sut.tableView
        let photoImageCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(photoImageCell is STPhotoCommentsViewCell)
    }
    
    func testShouldConfigureCommentCell() {
        self.loadView()
        
        let items = [self.displayedComment()]
        self.sut.displayedComments = items
        
        let tableView = self.sut.tableView
        items.enumerated().forEach { (index, item) in
            let cell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: index, section: 0)) as! STPhotoCommentsViewCell
            XCTAssertNotNil(item.cellInterface)
            XCTAssertEqual(cell.avatarImageView?.image, item.avatarImage)
            XCTAssertEqual(cell.avatarActivityIndicatorView?.isHidden, !item.isLoadingUserImage)
            XCTAssertEqual(cell.nameLabel?.attributedText?.string, item.name)
            XCTAssertEqual(cell.commentLabel?.attributedText?.string, item.text)
            XCTAssertEqual(cell.timeLabel?.attributedText?.string, item.time)
        }
    }
    
    private func displayedComment() -> STPhotoComments.DisplayedComment {
        let displayedComment = STPhotoComments.DisplayedComment(id: "id")
        displayedComment.avatarImage = UIImage()
        displayedComment.avatarImageUrl = "https://streetography.com"
        displayedComment.name = "Name"
        displayedComment.isLoadingUserImage = false
        displayedComment.text = "Text"
        displayedComment.time = "Time"
        return displayedComment
    }
    
    // MARK: - Business logic tests
        
    func testShouldNotFetchPhotoCommentsWhenScrollViewDidScrollWhenScrollIsNotDecelerating() {
        let scrollView = UIScrollView()
        scrollView.contentSize.height = 300
        scrollView.frame.size.height = 100
        self.sut.scrollViewDidScroll(scrollView)
        XCTAssertFalse(self.interactorSpy.shouldFetchPhotoCommentsCalled)
    }
    
    func testShouldFetchAvatarImageWhenCreatingCell() {
        self.loadView()
        self.sut.displayedComments = [STPhotoComments.DisplayedComment(id: "id")]
        let tableView = self.sut.tableView
        let _ = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(self.interactorSpy.shouldFetchAvatarImageCalled)
    }
    
    // MARK: - Display logic tests
    
    func testDisplayWillFetchPhotoCommentsShouldSetTableFooterView() {
        self.sut.displayWillFetchPhotoComments()
        self.waitForMainQueue()
        XCTAssertNotNil(self.sut.tableView.tableFooterView)
        XCTAssertTrue(self.sut.tableView.tableFooterView is UIActivityIndicatorView)
    }
    
    func testDisplayDidFetchPhotoCommentsShouldRemoveTableFooterView() {
        self.loadView()
        self.sut.tableView.tableFooterView = UIView()
        self.sut.displayDidFetchPhotoComments()
        self.waitForMainQueue()
        XCTAssertNil(self.sut.tableView.tableFooterView)
    }
    
    func testDisplayPhotoCommentCountShouldUpdateCommentsButtonTitle() {
        let buttonSpy = UIButtonSpy(type: .system)
        self.sut.commentsButton = buttonSpy
        self.sut.displayPhotoCommentCount(title: "5 Comments")
        XCTAssertTrue(buttonSpy.setAttributedTitleCalled)
    }
    
    func testDisplayPhotoCommentsShouldUpdateDisplayedComments() {
        let count = self.sut.displayedComments.count
        let items = [STPhotoComments.DisplayedComment(id: "id")]
        self.sut.displayPhotoComments(viewModel: STPhotoComments.PresentComments.ViewModel(items: items))
        self.waitForMainQueue()
        XCTAssertEqual(self.sut.displayedComments.count, count + items.count)
    }
    
    func testDisplayPhotoCommentsShouldAskTheTableViewToInsertRowsInBatchUpdate() {
        let tableViewSpy = UITableViewSpy()
        tableViewSpy.dataSource = self.sut
        tableViewSpy.register(STPhotoCommentsViewCell.self, forCellReuseIdentifier: STPhotoCommentsViewCell.cellReuseIdentifier)
        self.sut.tableView = tableViewSpy
        self.sut.displayedComments = [STPhotoComments.DisplayedComment(id: "id")]
        
        self.sut.displayPhotoComments(viewModel: STPhotoComments.PresentComments.ViewModel(items: [STPhotoComments.DisplayedComment(id: "commentId")]))
        self.waitForMainQueue()
        XCTAssertTrue(tableViewSpy.performBatchUpdatesCalled)
        XCTAssertTrue(tableViewSpy.insertRowsCalled)
    }
    
    func testDisplayEmptyStateShouldSetTableBackgroundView() {
        self.sut.displayEmptyState()
        self.waitForMainQueue()
        XCTAssertNotNil(self.sut.tableView.backgroundView)
        XCTAssertTrue(self.sut.tableView.backgroundView is STPhotoCommentsEmptyView)
    }
    
    func testDisplayWillFetchAvatarImageShouldUpdateLoadingStateForDisplayedComment() {
        let cellInterfaceSpy = STPhotoCommentsViewCellInterfaceSpy()
        let displayedComment = STPhotoComments.DisplayedComment(id: "id")
        displayedComment.isLoadingUserImage = false
        displayedComment.cellInterface = cellInterfaceSpy
        self.sut.displayWillFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel(displayedComment: displayedComment))
        self.waitForMainQueue()
        XCTAssertTrue(displayedComment.isLoadingUserImage)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingUserAvatarCalled)
    }
    
    func testDisplayDidFetchAvatarImageShouldUpdateLoadingStateForDisplayedComment() {
        let cellInterfaceSpy = STPhotoCommentsViewCellInterfaceSpy()
        let displayedComment = STPhotoComments.DisplayedComment(id: "id")
        displayedComment.isLoadingUserImage = true
        displayedComment.cellInterface = cellInterfaceSpy
        self.sut.displayDidFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel(displayedComment: displayedComment))
        self.waitForMainQueue()
        XCTAssertFalse(displayedComment.isLoadingUserImage)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingUserAvatarCalled)
    }
    
    func testDisplayAvatarImageShouldUpdateAvatarImageForDisplayedComment() {
        let cellInterfaceSpy = STPhotoCommentsViewCellInterfaceSpy()
        let displayedComment = STPhotoComments.DisplayedComment(id: "id")
        displayedComment.cellInterface = cellInterfaceSpy
        displayedComment.avatarImage = nil
        let image = UIImage()
        self.sut.displayAvatarImage(viewModel: STPhotoComments.PresentAvatarImage.ViewModel(displayedComment: displayedComment, image: image))
        self.waitForMainQueue()
        XCTAssertEqual(displayedComment.avatarImage, image)
        XCTAssertTrue(cellInterfaceSpy.setAvatarImageCalled)
    }
}
