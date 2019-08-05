//
//  STPhotoDetailsViewController+TableViewDataSource.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

extension STPhotoDetailsViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedItem = self.displayedItems[indexPath.row]
        switch displayedItem.type {
            case .photoImage: return self.photoImageCell(tableView, indexPath: indexPath, item: displayedItem)
            case .photoDetails: return self.photoDetailsCell(tableView, indexPath: indexPath, item: displayedItem)
            case .photoCollection: return self.photoCollectionCell(tableView, indexPath: indexPath, item: displayedItem)
            case .photoLocation: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .blockEntity: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .neighborhoodEntity: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .cityEntity: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .countyEntity: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .stateEntity: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .countryEntity: return self.photoEntityCell(tableView, indexPath: indexPath, item: displayedItem)
            case .space: return self.spaceCell(tableView, indexPath: indexPath, item: displayedItem)
        }
    }
}

// MARK: - Photo image cell

extension STPhotoDetailsViewController {
    private func photoImageCell(_ tableView: UITableView, indexPath: IndexPath, item: STPhotoDetails.Item) -> STPhotoDetailsImageCell {
        guard let model = item.model as? STPhotoDetails.DisplayedPhotoImage else { return STPhotoDetailsImageCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: STPhotoDetailsImageCell.cellReuseIdentifier, for: indexPath) as? STPhotoDetailsImageCell ?? STPhotoDetailsImageCell()
        model.cellInterface = cell
        cell.setIsLoading(isLoading: model.isLoadingImage)
        cell.setBackgroundImageColor(color: model.imageDominantColor)
        cell.setImage(image: model.image)
        return cell
    }
}

// MARK: - Photo details cell

extension STPhotoDetailsViewController {
    private func photoDetailsCell(_ tableView: UITableView, indexPath: IndexPath, item: STPhotoDetails.Item) -> STPhotoDetailsInfoCell {
        guard let model = item.model as? STPhotoDetails.DisplayedPhotoDetails else { return STPhotoDetailsInfoCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: STPhotoDetailsInfoCell.cellReuseIdentifier, for: indexPath) as? STPhotoDetailsInfoCell ?? STPhotoDetailsInfoCell()
        model.cellInterface = cell
        cell.setIsLoadingUserAvatar(isLoading: model.isLoadingUserImage)
        cell.setAvatarImage(image: model.userImage)
        cell.setName(name: model.username)
        cell.setTime(time: model.photoTime)
        cell.setDescription(description: model.photoDescription)
        return cell
    }
}

// MARK: - Photo collection cell

extension STPhotoDetailsViewController {
    private func photoCollectionCell(_ tableView: UITableView, indexPath: IndexPath, item: STPhotoDetails.Item) -> STPhotoDetailsEntityCell {
        guard let model = item.model as? STPhotoDetails.DisplayedPhotoCollection else { return STPhotoDetailsEntityCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: STPhotoDetailsEntityCell.cellReuseIdentifier, for: indexPath) as? STPhotoDetailsEntityCell ?? STPhotoDetailsEntityCell()
        model.cellInterface = cell
        cell.setImage(image: model.image)
        cell.setTitle(title: model.title)
        cell.setName(name: model.name)
        cell.setIsLoading(isLoading: model.isLoading)
        return cell
    }
}

// MARK: - Photo entity cell

extension STPhotoDetailsViewController {
    private func photoEntityCell(_ tableView: UITableView, indexPath: IndexPath, item: STPhotoDetails.Item) -> STPhotoDetailsEntityCell {
        guard let model = item.model as? STPhotoDetails.DisplayedPhotoEntity else { return STPhotoDetailsEntityCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: STPhotoDetailsEntityCell.cellReuseIdentifier, for: indexPath) as? STPhotoDetailsEntityCell ?? STPhotoDetailsEntityCell()
        model.cellInterface = cell
        cell.setImage(image: model.image)
        cell.setTitle(title: model.title)
        cell.setName(name: model.name)
        cell.setIsLoading(isLoading: model.isLoading)
        return cell
    }
}

// MARK: - Empty space cell

extension STPhotoDetailsViewController {
    private func spaceCell(_ tableView: UITableView, indexPath: IndexPath, item: STPhotoDetails.Item) -> STPhotoDetailsSpaceCell {
        guard let model = item.model as? STPhotoDetails.DisplayedSpace else { return STPhotoDetailsSpaceCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: STPhotoDetailsSpaceCell.cellReuseIdentifier, for: indexPath) as? STPhotoDetailsSpaceCell ?? STPhotoDetailsSpaceCell()
        cell.setHeight(height: model.height)
        return cell
    }
}
