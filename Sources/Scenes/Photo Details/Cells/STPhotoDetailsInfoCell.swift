//
//  STPhotoDetailsInfoCell.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol STPhotoDetailsInfoCellInterface: NSObjectProtocol {
    func setAvatarImage(image: UIImage?)
    func setName(name: String)
    func setTime(time: String)
    func setDescription(description: String)
    func setIsLoadingUserAvatar(isLoading: Bool)
}

class STPhotoDetailsInfoCell: UITableViewCell {
    static let cellReuseIdentifier = "STPhotoDetailsInfoCell"
    
    weak var avatarImageView: RoundImageView!
    weak var avatarActivityIndicatorView: UIActivityIndicatorView!
    
    weak var nameLabel: UILabel!
    weak var spacerView: UIView!
    weak var timeLabel: UILabel!
    
    weak var descriptionLabel: UILabel!
    var descriptionLabelBottomConstraint: NSLayoutConstraint?
    
    weak var bottomSeparatorView: UIView!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: STPhotoDetailsInfoCell.cellReuseIdentifier)
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
    
    private func startAvatarActivityIndicatorView() {
        self.avatarActivityIndicatorView?.startAnimating()
    }
    
    private func stopAvatarActivityIndicatorView() {
        self.avatarActivityIndicatorView?.stopAnimating()
    }
    
    private func hideAvatarActivityIndicatorView() {
        self.avatarActivityIndicatorView?.isHidden = true
    }
    
    private func showAvatarActivityIndicatorView() {
        self.avatarActivityIndicatorView?.isHidden = false
    }
}

// MARK: - Cell interface

extension STPhotoDetailsInfoCell: STPhotoDetailsInfoCellInterface {
    func setAvatarImage(image: UIImage?) {
        self.avatarImageView?.image = image
    }
    
    func setName(name: String) {
        self.nameLabel?.attributedText = NSAttributedString(string: name, attributes: STPhotoDetailsStyle.shared.photoDetailsCellModel.nameAttributes)
    }
    
    func setTime(time: String) {
        self.timeLabel?.attributedText = NSAttributedString(string: time, attributes: STPhotoDetailsStyle.shared.photoDetailsCellModel.timeAttributes)
    }
    
    func setDescription(description: String) {
        self.descriptionLabel?.attributedText = NSAttributedString(string: description, attributes: STPhotoDetailsStyle.shared.photoDetailsCellModel.descriptionAttributes)
        self.descriptionLabelBottomConstraint?.constant = (description != "") ? -15 : 0
    }
    
    func setIsLoadingUserAvatar(isLoading: Bool) {
        if isLoading {
            self.startAvatarActivityIndicatorView()
            self.showAvatarActivityIndicatorView()
        } else {
            self.hideAvatarActivityIndicatorView()
            self.stopAvatarActivityIndicatorView()
        }
    }
}

// MARK: - Subviews configuration

extension STPhotoDetailsInfoCell {
    private func setupCell() {
        self.selectionStyle = .none
    }
    
    private func setupSubviews() {
        self.setupAvatarImageView()
        self.setupAvatarActivityIndicatorView()
        self.setupNameLabel()
        self.setupSpacerView()
        self.setupTimeLabel()
        self.setupDescriptionLabel()
        self.setupBottomSeparatorView()
    }
    
    private func setupAvatarImageView() {
        let imageView = RoundImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(imageView)
        self.avatarImageView = imageView
    }
    
    private func setupAvatarActivityIndicatorView() {
        let indicatorView = UIActivityIndicatorView(style: .white)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.hidesWhenStopped = false
        self.contentView.addSubview(indicatorView)
        self.avatarActivityIndicatorView = indicatorView
    }
    
    private func setupNameLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        self.contentView.addSubview(label)
        self.nameLabel = label
    }
    
    private func setupSpacerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.spacerView = view
    }
    
    private func setupTimeLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        self.contentView.addSubview(label)
        self.timeLabel = label
    }
    
    private func setupDescriptionLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        self.contentView.addSubview(label)
        self.descriptionLabel = label
    }
    
    private func setupBottomSeparatorView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = STPhotoDetailsStyle.shared.photoDetailsCellModel.separatorColor
        self.contentView.addSubview(view)
        self.bottomSeparatorView = view
    }
}

// MARK: - Constraints configuration

extension STPhotoDetailsInfoCell {
    private func setupSubviewsConstraints() {
        self.setupAvatarImageViewConstraints()
        self.setupAvatarActivityIndicatorViewConstraints()
        self.setupNameLabelConstraints()
        self.setupTimeLabelConstraints()
        self.setupSpacerViewConstraints()
        self.setupDescriptionLabelConstraints()
        self.setupBottomSeparatorViewConstraints()
    }
    
    private func setupAvatarImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            self.avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15)
        ])
    }
    
    private func setupAvatarActivityIndicatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.avatarActivityIndicatorView.centerXAnchor.constraint(equalTo: self.avatarImageView.centerXAnchor),
            self.avatarActivityIndicatorView.centerYAnchor.constraint(equalTo: self.avatarImageView.centerYAnchor),
            self.avatarActivityIndicatorView.widthAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 0.5),
            self.avatarActivityIndicatorView.heightAnchor.constraint(equalTo: self.avatarImageView.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            self.nameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 15),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.spacerView.topAnchor)
        ])
    }
    
    private func setupTimeLabelConstraints() {
        NSLayoutConstraint.activate([
            self.timeLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 15),
            self.timeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.timeLabel.topAnchor.constraint(equalTo: self.spacerView.bottomAnchor)
        ])
    }
    
    private func setupSpacerViewConstraints() {
        NSLayoutConstraint.activate([
            self.spacerView.heightAnchor.constraint(equalToConstant: 2),
            self.spacerView.centerYAnchor.constraint(equalTo: self.avatarImageView.centerYAnchor),
            self.spacerView.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 15),
            self.spacerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 15),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15)
        ])
        
        self.descriptionLabelBottomConstraint = self.descriptionLabel?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15)
        self.descriptionLabelBottomConstraint?.isActive = true
    }
    
    private func setupBottomSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.bottomSeparatorView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
            self.bottomSeparatorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.bottomSeparatorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.bottomSeparatorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}

class RoundImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(self.bounds.width, self.bounds.height) / 2
    }
}
