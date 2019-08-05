//
//  STPhotoDetailsEntityCell.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol STPhotoDetailsEntityCellInterface: NSObjectProtocol {
    func setImage(image: UIImage?)
    func setTitle(title: String)
    func setName(name: String)
    func setIsLoading(isLoading: Bool)
}

class STPhotoDetailsEntityCell: UITableViewCell {
    static let cellReuseIdentifier = "STPhotoDetailsEntityCell"
    
    weak var entityImageView: UIImageView!
    weak var entityTitleLabel: UILabel!
    weak var entityNameLabel: UILabel!
    weak var activityIndicatorView: UIActivityIndicatorView!
    weak var bottomSeparatorView: UIView!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: STPhotoDetailsEntityCell.cellReuseIdentifier)
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

extension STPhotoDetailsEntityCell: STPhotoDetailsEntityCellInterface {
    func setImage(image: UIImage?) {
        self.entityImageView?.image = image
    }
    
    func setTitle(title: String) {
        self.entityTitleLabel?.attributedText = NSAttributedString(string: title, attributes: STPhotoDetailsStyle.shared.photoEntityCellModel.titleAttributes)
    }
    
    func setName(name: String) {
        self.entityNameLabel?.attributedText = NSAttributedString(string: name, attributes: STPhotoDetailsStyle.shared.photoEntityCellModel.nameAttributes)
    }
    
    func setIsLoading(isLoading: Bool) {
        if isLoading {
            self.startActivityIndicatorView()
            self.showActivityIndicatorView()
        } else {
            self.hideActivityIndicatorView()
            self.stopActivityIndicatorView()
        }
    }
}

// MARK: - Subviews configuration

extension STPhotoDetailsEntityCell {
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = STPhotoDetailsStyle.shared.photoEntityCellModel.backgroundColor
    }
    
    private func setupSubviews() {
        self.setupEntityImageView()
        self.setupEntityTitleLabel()
        self.setupEntityNameLabel()
        self.setupActivityIndicatorView()
        self.setupBottomSeparatorView()
    }
    
    private func setupEntityImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        self.contentView.addSubview(imageView)
        self.entityImageView = imageView
    }
    
    private func setupEntityTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.contentView.addSubview(label)
        self.entityTitleLabel = label
    }
    
    private func setupEntityNameLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        self.contentView.addSubview(label)
        self.entityNameLabel = label
    }
    
    private func setupActivityIndicatorView() {
        let view = UIActivityIndicatorView(style: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.activityIndicatorView = view
    }
    
    private func setupBottomSeparatorView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = STPhotoDetailsStyle.shared.photoEntityCellModel.separatorColor
        self.contentView.addSubview(view)
        self.bottomSeparatorView = view
    }
}

// MARK: - Constraints configuration

extension STPhotoDetailsEntityCell {
    private func setupSubviewsConstraints() {
        self.setupEntityImageViewConstraints()
        self.setupEntityTitleLabelConstraints()
        self.setupEntityNameLabelConstraints()
        self.setupActivityIndicatorViewConstraints()
        self.setupBottomSeparatorViewConstraints()
    }
    
    private func setupEntityImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.entityImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.entityImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.entityImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.entityImageView.widthAnchor.constraint(equalTo: self.entityImageView.heightAnchor),
            self.entityImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupEntityTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.entityTitleLabel.leadingAnchor.constraint(equalTo: self.entityImageView.trailingAnchor, constant: 15),
            self.entityTitleLabel.trailingAnchor.constraint(equalTo: self.entityNameLabel.leadingAnchor, constant: -10),
            self.entityTitleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func setupEntityNameLabelConstraints() {
        NSLayoutConstraint.activate([
            self.entityNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.entityNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func setupActivityIndicatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.activityIndicatorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.activityIndicatorView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func setupBottomSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.bottomSeparatorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.bottomSeparatorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.bottomSeparatorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.bottomSeparatorView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale)
        ])
    }
}
