//
//  STPhotoCommentsEmptyView.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

class STPhotoCommentsEmptyView: UIView {
    weak var imageView: UIImageView!
    weak var titleLabel: UILabel!
    weak var spaceView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Subviews configuration

extension STPhotoCommentsEmptyView {
    private func setupSubviews() {
        self.setupImageView()
        self.setupTitleLabel()
        self.setupSpaceView()
    }
    
    private func setupImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = STPhotoCommentsStyle.shared.emptyViewModel.image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        self.addSubview(imageView)
        self.imageView = imageView
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSAttributedString(string: STPhotoCommentsLocalization.shared.emptyStateText, attributes: STPhotoCommentsStyle.shared.emptyViewModel.titleAttributes)
        self.addSubview(label)
        self.titleLabel = label
    }
    
    private func setupSpaceView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.spaceView = view
    }
}

// MARK: - Constraints configuration

extension STPhotoCommentsEmptyView {
    private func setupSubviewsConstraints() {
        self.setupImageViewConstraints()
        self.setupTitleLabelConstraints()
        self.setupSpaceViewConstraints()
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 25),
            self.imageView.heightAnchor.constraint(equalToConstant: 25),
            self.imageView.bottomAnchor.constraint(equalTo: self.spaceView.topAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.spaceView.bottomAnchor)
        ])
    }
    
    private func setupSpaceViewConstraints() {
        NSLayoutConstraint.activate([
            self.spaceView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.spaceView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.spaceView.widthAnchor.constraint(equalToConstant: 25),
            self.spaceView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
