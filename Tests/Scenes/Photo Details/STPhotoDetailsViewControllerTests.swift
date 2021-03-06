//
//  STPhotoDetailsViewControllerTests.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright (c) 2019 Streetography. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import STPhotoDetails
import XCTest

class STPhotoDetailsViewControllerTests: XCTestCase {
    var sut: STPhotoDetailsViewController!
    var interactorSpy: STPhotoDetailsBusinessLogicSpy!
    var routerSpy: STPhotoDetailsRoutingLogicSpy!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        self.window = UIWindow()
        self.setupSTPhotoDetailsViewController()
    }
    
    override func tearDown() {
        self.window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSTPhotoDetailsViewController() {
        self.sut = STPhotoDetailsViewController(photoId: "photoId")
        let _ = UINavigationController(rootViewController: self.sut)
        
        self.interactorSpy = STPhotoDetailsBusinessLogicSpy()
        self.sut.interactor = self.interactorSpy
        
        self.routerSpy = STPhotoDetailsRoutingLogicSpy()
        self.sut.router = self.routerSpy
    }
    
    func loadView() {
        self.window.addSubview(self.sut.view)
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
    
    func testAddPhotoLikesViewWhenViewDidLoad() {
        self.loadView()
        XCTAssertNotNil(self.sut.photoLikesView)
    }
    
    func testAddTableViewViewWhenViewDidLoad() {
        self.loadView()
        XCTAssertNotNil(self.sut.tableView)
    }
    
    func testAddPhotoCommentsViewWhenViewDidLoad() {
        self.loadView()
        XCTAssertNotNil(self.sut.photoCommentsView)
    }
    
    func testIfViewControllerConformsToUITableViewDataSourceProtocol() {
        self.loadView()
        XCTAssertTrue(self.sut.conforms(to: UITableViewDataSource.self))
    }
    
    func testIfViewControllerHasSetSTPhotoLikesViewDelegate() {
        self.loadView()
        XCTAssertNotNil(self.sut.photoLikesView.delegate)
    }
    
    func testIfViewControllerHasSetUITableViewDataSource() {
        self.loadView()
        XCTAssertNotNil(self.sut.tableView.dataSource)
    }
    
    func testHideNavigationBarWhenViewWillAppear() {
        self.sut.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.sut.viewWillAppear(true)
        
        XCTAssertNotNil(self.sut.navigationController)
        if let navigationController = self.sut.navigationController {
            XCTAssertTrue(navigationController.isNavigationBarHidden)
        }
    }
    
    // MARK: - Table view tests
    
    func testNumberOfRowsInAnySectionShouldEqualItemCount() {
        self.loadView()
        self.sut.displayedItems = [STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: nil)]
        let numberOfRows = self.sut.tableView(self.sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, self.sut.displayedItems.count)
    }
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {
        self.loadView()
        let tableView = self.sut.tableView
        let numberOfSections = self.sut.numberOfSections(in: tableView!)
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testCellForRowShouldReturnCorrectCellForItemType() {
        self.loadView()
        
        self.sut.displayedItems = [
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoDetails, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoCollection, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoLocation, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.blockEntity, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.neighborhoodEntity, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.cityEntity, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.countyEntity, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.stateEntity, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.countryEntity, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.space, model: nil)
        ]
        
        let tableView = self.sut.tableView
        
        let photoImageCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 0, section: 0))
        let photoDetailsCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 1, section: 0))
        let photoCollectionCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 2, section: 0))
        let photoLocationCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 3, section: 0))
        let photoBlockCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 4, section: 0))
        let photoNeighborhoodCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 5, section: 0))
        let photoCityCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 6, section: 0))
        let photoCountyCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 7, section: 0))
        let photoStateCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 8, section: 0))
        let photoCountryCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 9, section: 0))
        let emptySpaceCell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: 10, section: 0))
        
        XCTAssertTrue(photoImageCell is STPhotoDetailsImageCell)
        XCTAssertTrue(photoDetailsCell is STPhotoDetailsInfoCell)
        XCTAssertTrue(photoCollectionCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoLocationCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoBlockCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoNeighborhoodCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoCityCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoCountyCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoStateCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(photoCountryCell is STPhotoDetailsEntityCell)
        XCTAssertTrue(emptySpaceCell is STPhotoDetailsSpaceCell)
    }
    
    func testShouldConfigurePhotoImageCell() {
        self.loadView()
        
        let items = [STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: self.photoImageItemModel())]
        self.sut.displayedItems = items
        
        let tableView = self.sut.tableView
        items.enumerated().forEach { (index, item) in
            let cell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: index, section: 0)) as! STPhotoDetailsImageCell
            
            XCTAssertTrue(item.model is STPhotoDetails.DisplayedPhotoImage)
            
            if let model = item.model as? STPhotoDetails.DisplayedPhotoImage {
                XCTAssertNotNil(model.cellInterface)
                XCTAssertEqual(cell.photoImageView?.backgroundColor, model.imageDominantColor)
                XCTAssertEqual(cell.photoImageView?.image, model.image)
                XCTAssertEqual(cell.activityIndicatorView?.isHidden, !model.isLoadingImage)
            }
        }
    }
    
    private func photoImageItemModel() -> STPhotoDetails.DisplayedPhotoImage {
        let model = STPhotoDetails.DisplayedPhotoImage()
        model.image = UIImage()
        model.imageDominantColor = UIColor.blue
        model.isLoadingImage = true
        return model
    }
    
    func testShouldConfigurePhotoInfoCell() {
        self.loadView()
        
        let items = [STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoDetails, model: self.photoDetailsItemModel())]
        self.sut.displayedItems = items
        
        let tableView = self.sut.tableView
        items.enumerated().forEach { (index, item) in
            let cell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: index, section: 0)) as! STPhotoDetailsInfoCell
            
            XCTAssertTrue(item.model is STPhotoDetails.DisplayedPhotoDetails)
            
            if let model = item.model as? STPhotoDetails.DisplayedPhotoDetails {
                XCTAssertNotNil(model.cellInterface)
                XCTAssertEqual(cell.avatarImageView?.image, model.userImage)
                XCTAssertEqual(cell.avatarImageView?.isHidden, !model.isLoadingUserImage)
                XCTAssertEqual(cell.nameLabel?.attributedText?.string, model.username)
                XCTAssertEqual(cell.timeLabel?.attributedText?.string, model.photoTime)
                XCTAssertEqual(cell.descriptionLabel?.attributedText?.string, model.photoDescription)
            }
        }
    }
    
    private func photoDetailsItemModel() -> STPhotoDetails.DisplayedPhotoDetails {
        let model = STPhotoDetails.DisplayedPhotoDetails()
        model.isLoadingUserImage = true
        model.userImage = UIImage()
        model.username = "Username"
        model.photoDescription = "Description"
        model.photoTime = "Time"
        return model
    }
    
    func testShouldConfigurePhotoCollectionCell() {
        self.loadView()
        
        let items = [STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoCollection, model: self.photoCollectionItemModel())]
        self.sut.displayedItems = items
        
        let tableView = self.sut.tableView
        items.enumerated().forEach { (index, item) in
            let cell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: index, section: 0)) as! STPhotoDetailsEntityCell
            
            XCTAssertTrue(item.model is STPhotoDetails.DisplayedPhotoCollection)
            
            if let model = item.model as? STPhotoDetails.DisplayedPhotoCollection {
                XCTAssertNotNil(model.cellInterface)
                XCTAssertEqual(cell.entityImageView?.image, model.image)
                XCTAssertEqual(cell.entityTitleLabel?.attributedText?.string, model.title)
                XCTAssertEqual(cell.entityNameLabel?.attributedText?.string, model.name)
                XCTAssertEqual(cell.activityIndicatorView?.isHidden, !model.isLoading)
            }
        }
    }
    
    private func photoCollectionItemModel() -> STPhotoDetails.DisplayedPhotoCollection {
        let model = STPhotoDetails.DisplayedPhotoCollection()
        model.image = UIImage()
        model.title = "Collection"
        model.name = "Collection name"
        model.isLoading = true
        return model
    }
    
    func testShouldConfigurePhotoEntityCell() {
        self.loadView()
        
        let items = [STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoLocation, model: self.photoLocationItemModel())]
        self.sut.displayedItems = items
        
        let tableView = self.sut.tableView
        items.enumerated().forEach { (index, item) in
            let cell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: index, section: 0)) as! STPhotoDetailsEntityCell
            
            XCTAssertTrue(item.model is STPhotoDetails.DisplayedPhotoEntity)
            
            if let model = item.model as? STPhotoDetails.DisplayedPhotoEntity {
                XCTAssertNotNil(model.cellInterface)
                XCTAssertEqual(cell.entityImageView?.image, model.image)
                XCTAssertEqual(cell.entityTitleLabel?.attributedText?.string, model.title)
                XCTAssertEqual(cell.entityNameLabel?.attributedText?.string, model.name)
                XCTAssertEqual(cell.activityIndicatorView?.isHidden, !model.isLoading)
            }
        }
    }
    
    private func photoLocationItemModel() -> STPhotoDetails.DisplayedPhotoEntity {
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.image = UIImage()
        model.title = "Location"
        model.name = "Location name"
        model.isLoading = true
        return model
    }
    
    func testShouldConfigureEmptySpaceCell() {
        self.loadView()
        
        let items = [STPhotoDetails.Item(type: STPhotoDetails.ItemType.space, model: self.spaceItemModel())]
        self.sut.displayedItems = items
        
        let tableView = self.sut.tableView
        items.enumerated().forEach { (index, item) in
            let cell = self.sut.tableView(tableView!, cellForRowAt: IndexPath(row: index, section: 0)) as! STPhotoDetailsSpaceCell
            
            XCTAssertTrue(item.model is STPhotoDetails.DisplayedSpace)
            
            if let model = item.model as? STPhotoDetails.DisplayedSpace {
                XCTAssertEqual(cell.spaceViewHeightConstraint?.constant, model.height)
            }
        }
    }
    
    private func spaceItemModel() -> STPhotoDetails.DisplayedSpace {
        let model = STPhotoDetails.DisplayedSpace()
        model.height = 50
        return model
    }
    
    // MARK: - Routing logic tests
    
    func testRemoveViewControllerWhenBackButtonIsSelected() {
        self.sut.photoLikesView(view: nil, didSelectBackButton: nil)
        XCTAssertTrue(self.routerSpy.removeViewControllerCalled)
    }
    
    // MARK: - Business logic tests
    
    func testSetPhotoIdWhenViewDidLoad() {
        self.loadView()
        XCTAssertTrue(self.interactorSpy.setPhotoIdCalled)
    }
    
    func testShouldFetchPhotoWhenViewDidLoad() {
        self.loadView()
        XCTAssertTrue(self.interactorSpy.shouldFetchPhotoCalled)
    }
    
    // MARK: - Display logic tests
    
    func testDisplayWillFetchPhotoShouldShowActivityIndicator() {
        self.loadView()
        self.sut.tableView?.backgroundView = nil
        self.sut.displayWillFetchPhoto()
        self.waitForMainQueue()
        XCTAssertNotNil(self.sut.tableView.backgroundView)
    }
    
    func testDisplayWillFetchPhotoShouldHidePhotoCommentsView() {
        self.loadView()
        self.sut.photoCommentsView?.isHidden = false
        self.sut.displayWillFetchPhoto()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.photoCommentsView.isHidden)
    }
    
    func testDisplayDidFetchPhotoShouldHideActivityIndicator() {
        self.loadView()
        self.sut.tableView?.backgroundView = self.sut.activityView
        self.sut.displayDidFetchPhoto()
        self.waitForMainQueue()
        XCTAssertNil(self.sut.tableView.backgroundView)
    }
    
    func testDisplayDidFetchPhotoShouldShowPhotoCommentsView() {
        self.loadView()
        self.sut.photoCommentsView?.isHidden = true
        self.sut.displayDidFetchPhoto()
        self.waitForMainQueue()
        XCTAssertFalse(self.sut.photoCommentsView.isHidden)
    }
    
    func testDisplayPhotoShouldUpdateDisplayedItems() {
        self.loadView()
        let items = [
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: nil),
            STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoDetails, model: nil)
        ]
        self.sut.displayPhoto(viewModel: STPhotoDetails.PresentPhoto.ViewModel(items: items))
        self.waitForMainQueue()
        XCTAssertEqual(self.sut.displayedItems.count, items.count)
        XCTAssertTrue((self.sut.displayedItems.elementsEqual(items, by: { $0 == $1 })))
    }
    
    func testDisplayPhotoShouldAskTheTableViewToReloadData() {
        let tableViewSpy = UITableViewSpy()
        self.sut.tableView = tableViewSpy
        self.sut.displayPhoto(viewModel: STPhotoDetails.PresentPhoto.ViewModel(items: []))
        self.waitForMainQueue()
        XCTAssertTrue(tableViewSpy.reloadDataCalled)
    }
    
    func testDisplayWillFetchPhotoImageShouldUpdateLoadingStateForPhotoImageItem() {
        let cellInterfaceSpy = STPhotoDetailsImageCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoImage()
        model.isLoadingImage = false
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: model) ]
        
        self.sut.displayWillFetchPhotoImage()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoImage)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoImage)?.isLoadingImage, true)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayDidFetchPhotoImageShouldUpdateLoadingStateForPhotoImageItem() {
        let cellInterfaceSpy = STPhotoDetailsImageCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoImage()
        model.isLoadingImage = true
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: model) ]
        
        self.sut.displayDidFetchPhotoImage()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoImage)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoImage)?.isLoadingImage, false)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayPhotoImageShouldUpdateImageForPhotoImageItem() {
        let cellInterfaceSpy = STPhotoDetailsImageCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoImage()
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoImage, model: model) ]
        
        let image = UIImage()
        self.sut.displayPhotoImage(viewModel: STPhotoDetails.PresentPhotoImage.ViewModel(image: image))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoImage)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoImage)?.image, image)
        XCTAssertTrue(cellInterfaceSpy.setImageCalled)
    }
    
    func testDisplayWillFetchPhotoUserImageShouldUpdateLoadingStateForPhotoDetailsItem() {
        let cellInterfaceSpy = STPhotoDetailsInfoCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoDetails()
        model.isLoadingUserImage = false
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoDetails, model: model) ]
        
        self.sut.displayWillFetchPhotoUserImage()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoDetails)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoDetails)?.isLoadingUserImage, true)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingUserAvatarCalled)
    }
    
    func testDisplayDidFetchPhotoUserImageShouldUpdateLoadingStateForPhotoDetailsItem() {
        let cellInterfaceSpy = STPhotoDetailsInfoCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoDetails()
        model.isLoadingUserImage = true
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoDetails, model: model) ]
        
        self.sut.displayDidFetchPhotoUserImage()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoDetails)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoDetails)?.isLoadingUserImage, false)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingUserAvatarCalled)
    }
    
    func testDisplayPhotoUserImageShouldUpdateImageForPhotoDetailsItem() {
        let cellInterfaceSpy = STPhotoDetailsInfoCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoDetails()
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoDetails, model: model) ]
        
        let image = UIImage()
        self.sut.displayPhotoUserImage(viewModel: STPhotoDetails.PresentPhotoUserImage.ViewModel(image: image))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoDetails)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoDetails)?.userImage, image)
        XCTAssertTrue(cellInterfaceSpy.setAvatarImageCalled)
    }
    
    func testDisplayWillFetchPhotoCollectionShouldUpdateLoadingStateForCollectionEntityItem() {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoCollection()
        model.isLoading = false
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoCollection, model: model) ]
        
        self.sut.displayWillFetchPhotoCollection()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoCollection)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoCollection)?.isLoading, true)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayDidFetchPhotoCollectionShouldUpdateLoadingStateForCollectionEntityItem() {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoCollection()
        model.isLoading = true
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoCollection, model: model) ]
        
        self.sut.displayDidFetchPhotoCollection()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoCollection)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoCollection)?.isLoading, false)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayPhotoCollectionShouldUpdateNameForCollectionEntityItem() {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoCollection()
        model.cellInterface = cellInterfaceSpy
        model.name = "name"
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoCollection, model: model) ]
        
        let collectionName = "Collection name"
        self.sut.displayPhotoCollection(viewModel: STPhotoDetails.PresentPhotoCollection.ViewModel(name: collectionName))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoCollection)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoCollection)?.name, collectionName)
        XCTAssertTrue(cellInterfaceSpy.setNameCalled)
    }
    
    func testDisplayWillFetchPhotoLocationAddressShouldUpdateLoadingStateForLocationEntityItem() {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.isLoading = false
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoLocation, model: model) ]
        
        self.sut.displayWillFetchPhotoLocationAddress()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoEntity)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoEntity)?.isLoading, true)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayDidFetchPhotoLocationAddressShouldUpdateLoadingStateForLocationEntityItem() {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.isLoading = true
        model.cellInterface = cellInterfaceSpy
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoLocation, model: model) ]
        
        self.sut.displayDidFetchPhotoLocationAddress()
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoEntity)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoEntity)?.isLoading, false)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayPhotoLocationAddressShouldUpdateNameForLocationEntityItem() {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.cellInterface = cellInterfaceSpy
        model.name = "name"
        self.sut.displayedItems = [ STPhotoDetails.Item(type: STPhotoDetails.ItemType.photoLocation, model: model) ]
        
        let address = "Address"
        self.sut.displayPhotoLocationAddress(viewModel: STPhotoDetails.PresentPhotoLocationAddress.ViewModel(address: address))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoEntity)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoEntity)?.name, address)
        XCTAssertTrue(cellInterfaceSpy.setNameCalled)
    }
    
    func testDisplayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForBlock() {
        self.displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.blockEntity)
    }
    
    func testDisplayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForNeighborhood() {
        self.displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.neighborhoodEntity)
    }
    
    func testDisplayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForCity() {
        self.displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.cityEntity)
    }
    
    func testDisplayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForCounty() {
        self.displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.countyEntity)
    }
    
    func testDisplayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForState() {
        self.displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.stateEntity)
    }
    
    func testDisplayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForCountry() {
        self.displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.countryEntity)
    }
    
    func displayWillFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType) {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.cellInterface = cellInterfaceSpy
        model.isLoading = false
        self.sut.displayedItems = [ STPhotoDetails.Item(type: type, model: model) ]
        
        self.sut.displayWillFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel(type: type))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoEntity)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoEntity)?.isLoading, true)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForBlock() {
        self.displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.blockEntity)
    }
    
    func testDisplayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForNeighborhood() {
        self.displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.neighborhoodEntity)
    }
    
    func testDisplayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForCity() {
        self.displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.cityEntity)
    }
    
    func testDisplayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForCounty() {
        self.displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.countyEntity)
    }
    
    func testDisplayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForState() {
        self.displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.stateEntity)
    }
    
    func testDisplayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForCountry() {
        self.displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.countryEntity)
    }
    
    func displayDidFetchPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType) {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.cellInterface = cellInterfaceSpy
        model.isLoading = true
        self.sut.displayedItems = [ STPhotoDetails.Item(type: type, model: model) ]
        
        self.sut.displayDidFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel(type: type))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoEntity)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoEntity)?.isLoading, false)
        XCTAssertTrue(cellInterfaceSpy.setIsLoadingCalled)
    }
    
    func testDisplayPhotoLocationEntityShouldUpdateLoadingStateForBlock() {
        self.displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.blockEntity)
    }
    
    func testDisplayPhotoLocationEntityShouldUpdateLoadingStateForNeighborhood() {
        self.displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.neighborhoodEntity)
    }
    
    func testDisplayPhotoLocationEntityShouldUpdateLoadingStateForCity() {
        self.displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.cityEntity)
    }
    
    func testDisplayPhotoLocationEntityShouldUpdateLoadingStateForCounty() {
        self.displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.countyEntity)
    }
    
    func testDisplayPhotoLocationEntityShouldUpdateLoadingStateForState() {
        self.displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.stateEntity)
    }
    
    func testDisplayPhotoLocationEntityShouldUpdateLoadingStateForCountry() {
        self.displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType.countryEntity)
    }
    
    func displayPhotoLocationEntityShouldUpdateLoadingStateForPhotoEntityItem(type: STPhotoDetails.ItemType) {
        let cellInterfaceSpy = STPhotoDetailsEntityCellInterfaceSpy()
        let model = STPhotoDetails.DisplayedPhotoEntity()
        model.cellInterface = cellInterfaceSpy
        model.name = "name"
        self.sut.displayedItems = [ STPhotoDetails.Item(type: type, model: model) ]
        
        let name = "entity"
        self.sut.displayPhotoLocationEntity(viewModel: STPhotoDetails.PresentPhotoLocationEntity.ViewModel(type: type, name: name))
        self.waitForMainQueue()
        XCTAssertTrue(self.sut.displayedItems.first?.model is STPhotoDetails.DisplayedPhotoEntity)
        XCTAssertEqual((self.sut.displayedItems.first?.model as? STPhotoDetails.DisplayedPhotoEntity)?.name, name)
        XCTAssertTrue(cellInterfaceSpy.setNameCalled)
    }
    
    func testDisplayPhotoLikesShouldAskPhotoLikesViewToSetLikes() {
        let photoLikesViewSpy = STPhotoDetailsLikesViewSpy()
        self.sut.photoLikesView = photoLikesViewSpy
        
        self.sut.displayPhotoLikes(viewModel: STPhotoDetails.PresentPhotoLikes.ViewModel(title: "5 Likes"))
        self.waitForMainQueue()
        XCTAssertTrue(photoLikesViewSpy.setLikesCalled)
    }
    
    func testDisplayPhotoLikesShouldAskPhotoLikesViewToShowLikes() {
        let photoLikesViewSpy = STPhotoDetailsLikesViewSpy()
        self.sut.photoLikesView = photoLikesViewSpy
        
        self.sut.displayPhotoLikes(viewModel: STPhotoDetails.PresentPhotoLikes.ViewModel(title: "5 Likes"))
        self.waitForMainQueue()
        XCTAssertTrue(photoLikesViewSpy.showLikesCalled)
    }
    
    func testDisplayPhotoCommentsShouldAskPhotoCommentsViewToDisplayCommentCount() {
        let photoCommentsViewSpy = STPhotoCommentsViewSpy(photoId: self.sut.photoId)
        self.sut.photoCommentsView = photoCommentsViewSpy
        
        self.sut.displayPhotoComments(viewModel: STPhotoDetails.PresentPhotoComments.ViewModel(title: "5 Comments"))
        self.waitForMainQueue()
        XCTAssertTrue(photoCommentsViewSpy.displayPhotoCommentCountCalled)
    }
}

extension STPhotoDetails.Item: Equatable {
    public static func ==(lhs: STPhotoDetails.Item, rhs: STPhotoDetails.Item) -> Bool {
        let sameType = lhs.type == rhs.type
        if sameType && lhs.model == nil && rhs.model == nil {
            return true
        }
        guard sameType, let lhsModel = lhs.model, let rhsModel = rhs.model else {
            return false
        }
        return Mirror(reflecting: lhsModel).subjectType == Mirror(reflecting: rhsModel).subjectType
    }
}
