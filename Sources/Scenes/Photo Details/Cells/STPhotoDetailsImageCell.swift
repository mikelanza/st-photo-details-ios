//
//  STPhotoDetailsImageCell.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol STPhotoDetailsImageCellInterface: NSObjectProtocol {
    func setIsLoading(isLoading: Bool)
    func setBackgroundImageColor(color: UIColor?)
    func setImage(image: UIImage?)
}

class STPhotoDetailsImageCell: UITableViewCell {
    static let cellReuseIdentifier = "STPhotoDetailsImageCell"
    
    weak var photoImageView: UIImageView!
    weak var activityIndicatorView: UIActivityIndicatorView!
    
    private var cellHeightConstraint: NSLayoutConstraint?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: STPhotoDetailsImageCell.cellReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func imageViewHeightFor(imageSize: CGSize) -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.size.width
        let imageWidth = imageSize.width
        let imageHeight = imageSize.height
        
        let newImageViewHeight: CGFloat
        if imageWidth > imageHeight {
            newImageViewHeight = (deviceWidth * imageHeight) / imageWidth
        } else if imageWidth < imageHeight {
            newImageViewHeight = (deviceWidth * imageHeight) / imageWidth
        } else if imageWidth == imageHeight {
            newImageViewHeight = deviceWidth
        } else {
            newImageViewHeight = deviceWidth
        }
        
        return newImageViewHeight
    }
    
    private func startActivityIndicatorView() {
        self.activityIndicatorView?.startAnimating()
    }
    
    private func stopActivityIndicatorView() {
        self.activityIndicatorView?.stopAnimating()
    }
    
    private func hideActivityIndicatorView() {
        self.activityIndicatorView?.isHidden = true
    }
    
    private func showActivityIndicatorView() {
        self.activityIndicatorView?.isHidden = false
    }
}

// MARK: - Cell interface

extension STPhotoDetailsImageCell: STPhotoDetailsImageCellInterface {
    func setIsLoading(isLoading: Bool) {
        if isLoading {
            self.startActivityIndicatorView()
            self.showActivityIndicatorView()
        } else {
            self.hideActivityIndicatorView()
            self.stopActivityIndicatorView()
        }
    }
    
    func setBackgroundImageColor(color: UIColor?) {
        self.photoImageView?.backgroundColor = color ?? UIColor.lightGray
    }
    
    func setImage(image: UIImage?) {
        if let image = image {
            self.updateCellHeightConstraint(height: self.imageViewHeightFor(imageSize: image.size))
        }
        self.photoImageView?.image = image
    }
}

// MARK: - Subviews configuration

extension STPhotoDetailsImageCell {
    private func setupCell() {
        self.selectionStyle = .none
    }
    
    private func setupSubviews() {
        self.setupPhotoImageView()
        self.setupActivityIndicatorView()
    }
    
    private func setupPhotoImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        self.contentView.addSubview(imageView)
        self.photoImageView = imageView
    }
    
    private func setupActivityIndicatorView() {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.activityIndicatorView = view
    }
}

// MARK: - Constraints configuration

extension STPhotoDetailsImageCell {
    private func setupSubviewsConstraints() {
        self.setupPhotoImageViewConstraints()
        self.setupActivityIndicatorViewConstraints()
        self.setupCellHeightConstraint()
    }
    
    private func setupPhotoImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.photoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        ])
    }
    
    private func setupActivityIndicatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.activityIndicatorView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func setupCellHeightConstraint() {
        self.cellHeightConstraint = self.contentView.heightAnchor.constraint(equalToConstant: self.contentView.bounds.width)
        self.cellHeightConstraint?.priority = UILayoutPriority.init(999)
        self.cellHeightConstraint?.isActive = true
    }
    
    private func updateCellHeightConstraint(height: CGFloat) {
        self.cellHeightConstraint?.constant = height
    }
}
