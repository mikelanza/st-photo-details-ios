//
//  STPhotoCommentsViewCell.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol STPhotoCommentsViewCellInterface: NSObjectProtocol {
    func setAvatarImage(image: UIImage?)
    func setName(name: String)
    func setTime(time: String)
    func setComment(comment: String)
    func setIsLoadingUserAvatar(isLoading: Bool)
}

class STPhotoCommentsViewCell: UITableViewCell {
    static let cellReuseIdentifier = "STPhotoCommentsViewCell"
    
    weak var avatarImageView: RoundImageView!
    weak var avatarActivityIndicatorView: UIActivityIndicatorView!
    
    weak var containerView: UIView!
    weak var nameLabel: UILabel!
    weak var commentLabel: UILabel!
    
    weak var timeLabel: UILabel!
    
    weak var bottomSeparatorView: UIView!
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: STPhotoCommentsViewCell.cellReuseIdentifier)
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

extension STPhotoCommentsViewCell: STPhotoCommentsViewCellInterface {
    func setAvatarImage(image: UIImage?) {
        self.avatarImageView?.image = image
    }
    
    func setName(name: String) {
        self.nameLabel?.attributedText = NSAttributedString(string: name, attributes: STPhotoCommentsStyle.shared.commentsViewCellModel.nameAttributes)
    }
    
    func setTime(time: String) {
        self.timeLabel?.attributedText = NSAttributedString(string: time, attributes: STPhotoCommentsStyle.shared.commentsViewCellModel.timeAttributes)
    }
    
    func setComment(comment: String) {
        self.commentLabel?.attributedText = NSAttributedString(string: comment, attributes: STPhotoCommentsStyle.shared.commentsViewCellModel.commentAttributes)
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

extension STPhotoCommentsViewCell {
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
    }
    
    private func setupSubviews() {
        self.setupAvatarImageView()
        self.setupAvatarActivityIndicatorView()
        self.setupContainerView()
        self.setupCommentLabel()
        self.setupNameLabel()
        self.setupTimeLabel()
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
    
    private func setupContainerView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.containerView = view
    }
    
    private func setupCommentLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.setContentHuggingPriority(.init(250), for: .horizontal)
        label.setContentHuggingPriority(.init(750), for: .vertical)
        label.setContentCompressionResistancePriority(.init(751), for: .vertical)
        self.containerView?.addSubview(label)
        self.commentLabel = label
    }
    
    private func setupNameLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.containerView?.addSubview(label)
        self.nameLabel = label
    }
    
    private func setupTimeLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        self.containerView?.addSubview(label)
        self.timeLabel = label
    }
    
    private func setupBottomSeparatorView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = STPhotoCommentsStyle.shared.commentsViewCellModel.separatorColor
        self.contentView.addSubview(view)
        self.bottomSeparatorView = view
    }
}

// MARK: - Constraints configuration

extension STPhotoCommentsViewCell {
    private func setupSubviewsConstraints() {
        self.setupAvatarImageViewConstraints()
        self.setupAvatarActivityIndicatorViewConstraints()
        self.setupContainerViewConstraints()
        self.setupCommentLabelConstraints()
        self.setupTimeLabelConstraints()
        self.setupNameLabelConstraints()
        self.setupBottomSeparatorViewConstraints()
    }
    
    private func setupAvatarImageViewConstraints() {
        let bottomConstraint = self.avatarImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -15)
        bottomConstraint.priority = UILayoutPriority.init(999)
        
        NSLayoutConstraint.activate([
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            self.avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.avatarImageView.trailingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: -15),
            bottomConstraint
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
    
    private func setupTimeLabelConstraints() {
        NSLayoutConstraint.activate([
            self.timeLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.timeLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor)
        ])
    }
    
    private func setupContainerViewConstraints() {
        let topConstraint = self.containerView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 15)
        topConstraint.priority = .init(rawValue: 999)
        
        let bottomConstraint = self.containerView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -15)
        bottomConstraint.priority = .init(rawValue: 999)
        
        NSLayoutConstraint.activate([
            self.containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            topConstraint,
            bottomConstraint
        ])
    }
    
    private func setupCommentLabelConstraints() {
        let topConstraint = self.commentLabel.topAnchor.constraint(equalTo: self.avatarImageView.topAnchor)
        topConstraint.priority = .init(250)
        
        NSLayoutConstraint.activate([
            self.commentLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
            self.commentLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor),
            self.commentLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.commentLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            topConstraint
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.timeLabel.leadingAnchor, constant: -15)
        ])
    }
    
    private func setupBottomSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            self.bottomSeparatorView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.bottomSeparatorView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.bottomSeparatorView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            self.bottomSeparatorView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale)
        ])
    }
}
