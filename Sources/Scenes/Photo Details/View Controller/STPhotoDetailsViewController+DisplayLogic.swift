//
//  STPhotoDetailsViewController+DisplayLogic.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation

protocol STPhotoDetailsDisplayLogic: class {
    func displayWillFetchPhoto()
    func displayDidFetchPhoto()
    func displayPhoto(viewModel: STPhotoDetails.PresentPhoto.ViewModel)
    
    func displayWillFetchPhotoImage()
    func displayDidFetchPhotoImage()
    func displayPhotoImage(viewModel: STPhotoDetails.PresentPhotoImage.ViewModel)
    
    func displayWillFetchPhotoUserImage()
    func displayDidFetchPhotoUserImage()
    func displayPhotoUserImage(viewModel: STPhotoDetails.PresentPhotoUserImage.ViewModel)
    
    func displayWillFetchPhotoCollection()
    func displayDidFetchPhotoCollection()
    func displayPhotoCollection(viewModel: STPhotoDetails.PresentPhotoCollection.ViewModel)
    
    func displayWillFetchPhotoLocationAddress()
    func displayDidFetchPhotoLocationAddress()
    func displayPhotoLocationAddress(viewModel: STPhotoDetails.PresentPhotoLocationAddress.ViewModel)
    
    func displayWillFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel)
    func displayDidFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel)
    func displayPhotoLocationEntity(viewModel: STPhotoDetails.PresentPhotoLocationEntity.ViewModel)
    
    func displayPhotoLikes(viewModel: STPhotoDetails.PresentPhotoLikes.ViewModel)
    func displayPhotoComments(viewModel: STPhotoDetails.PresentPhotoComments.ViewModel)
}

extension STPhotoDetailsViewController {
    func displayWillFetchPhoto() {
        DispatchQueue.main.async {
            self.tableView?.backgroundView = self.activityView
            self.photoCommentsView?.isHidden = true
        }
    }
    
    func displayDidFetchPhoto() {
        DispatchQueue.main.async {
            self.tableView?.backgroundView = nil
            self.photoCommentsView?.isHidden = false
        }
    }
    
    func displayPhoto(viewModel: STPhotoDetails.PresentPhoto.ViewModel) {
        DispatchQueue.main.async {
            self.displayedItems = viewModel.items
            self.tableView?.reloadData()
        }
    }
    
    func displayWillFetchPhotoImage() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoImageModel()
            model?.isLoadingImage = true
            model?.cellInterface?.setIsLoading(isLoading: true)
        }
    }
    
    func displayDidFetchPhotoImage() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoImageModel()
            model?.isLoadingImage = false
            model?.cellInterface?.setIsLoading(isLoading: false)
        }
    }
    
    func displayPhotoImage(viewModel: STPhotoDetails.PresentPhotoImage.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoImageModel()
            model?.image = viewModel.image
            model?.cellInterface?.setImage(image: viewModel.image)
        }
    }
    
    func displayWillFetchPhotoUserImage() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoDetailsModel()
            model?.isLoadingUserImage = true
            model?.cellInterface?.setIsLoadingUserAvatar(isLoading: true)
        }
    }
    
    func displayDidFetchPhotoUserImage() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoDetailsModel()
            model?.isLoadingUserImage = false
            model?.cellInterface?.setIsLoadingUserAvatar(isLoading: false)
        }
    }
    
    func displayPhotoUserImage(viewModel: STPhotoDetails.PresentPhotoUserImage.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoDetailsModel()
            model?.userImage = viewModel.image
            model?.cellInterface?.setAvatarImage(image: viewModel.image)
        }
    }
    
    func displayWillFetchPhotoCollection() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoCollectionModel()
            model?.isLoading = true
            model?.cellInterface?.setIsLoading(isLoading: true)
        }
    }
    
    func displayDidFetchPhotoCollection() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoCollectionModel()
            model?.isLoading = false
            model?.cellInterface?.setIsLoading(isLoading: false)
        }
    }
    
    func displayPhotoCollection(viewModel: STPhotoDetails.PresentPhotoCollection.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoCollectionModel()
            model?.name = viewModel.name
            model?.cellInterface?.setName(name: viewModel.name)
        }
    }
    
    func displayWillFetchPhotoLocationAddress() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoEntity(type: STPhotoDetails.ItemType.photoLocation)
            model?.isLoading = true
            model?.cellInterface?.setIsLoading(isLoading: true)
        }
    }
    
    func displayDidFetchPhotoLocationAddress() {
        DispatchQueue.main.async {
            let model = self.displayedPhotoEntity(type: STPhotoDetails.ItemType.photoLocation)
            model?.isLoading = false
            model?.cellInterface?.setIsLoading(isLoading: false)
        }
    }
    
    func displayPhotoLocationAddress(viewModel: STPhotoDetails.PresentPhotoLocationAddress.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoEntity(type: STPhotoDetails.ItemType.photoLocation)
            model?.name = viewModel.address
            model?.cellInterface?.setName(name: viewModel.address)
        }
    }
    
    func displayWillFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoEntity(type: viewModel.type)
            model?.isLoading = true
            model?.cellInterface?.setIsLoading(isLoading: true)
        }
    }
    
    func displayDidFetchPhotoLocationEntity(viewModel: STPhotoDetails.PhotoLocationEntityLoadingState.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoEntity(type: viewModel.type)
            model?.isLoading = false
            model?.cellInterface?.setIsLoading(isLoading: false)
        }
    }
    
    func displayPhotoLocationEntity(viewModel: STPhotoDetails.PresentPhotoLocationEntity.ViewModel) {
        DispatchQueue.main.async {
            let model = self.displayedPhotoEntity(type: viewModel.type)
            model?.name = viewModel.name
            model?.cellInterface?.setName(name: viewModel.name)
        }
    }
    
    func displayPhotoLikes(viewModel: STPhotoDetails.PresentPhotoLikes.ViewModel) {
        DispatchQueue.main.async {
            self.photoLikesView?.setLikes(title: viewModel.title)
            self.photoLikesView?.showLikes()
        }
    }
    
    func displayPhotoComments(viewModel: STPhotoDetails.PresentPhotoComments.ViewModel) {
        DispatchQueue.main.async {
            self.photoCommentsView?.displayPhotoCommentCount(title: viewModel.title)
        }
    }
}

extension STPhotoDetailsViewController {
    private func displayedPhotoImageModel() -> STPhotoDetails.DisplayedPhotoImage? {
        return self.displayedItems.first(where: { $0.type == .photoImage })?.model as? STPhotoDetails.DisplayedPhotoImage
    }
    
    private func displayedPhotoDetailsModel() -> STPhotoDetails.DisplayedPhotoDetails? {
        return self.displayedItems.first(where: { $0.type == .photoDetails })?.model as? STPhotoDetails.DisplayedPhotoDetails
    }
    
    private func displayedPhotoCollectionModel() -> STPhotoDetails.DisplayedPhotoCollection? {
        return self.displayedItems.first(where: { $0.type == .photoCollection })?.model as? STPhotoDetails.DisplayedPhotoCollection
    }
    
    private func displayedPhotoEntity(type: STPhotoDetails.ItemType) -> STPhotoDetails.DisplayedPhotoEntity? {
        return self.displayedItems.first(where: { $0.type == type })?.model as? STPhotoDetails.DisplayedPhotoEntity
    }
}
