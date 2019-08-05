//
//  STPhotoDetailsLikesView.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol STPhotoDetailsLikesViewDelegate: NSObjectProtocol {
    func photoLikesView(view: STPhotoDetailsLikesView?, didSelectBackButton button: UIButton?)
}

class STPhotoDetailsLikesView: UIView {
    private weak var backButton: UIButton!
    private weak var likesButton: UIButton!
    
    weak var delegate: STPhotoDetailsLikesViewDelegate?
    
    init() {
        super.init(frame: .zero)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubviews()
        self.setupSubviewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLikes(title: String) {
        self.likesButton?.setAttributedTitle(NSAttributedString(string: title, attributes: STPhotoDetailsStyle.shared.photoLikesViewModel.likesButtonTextAttributes), for: .normal)
    }
    
    func showLikes() {
        self.likesButton?.isHidden = false
    }
}

// MARK: - Subviews configuration

extension STPhotoDetailsLikesView {
    private func setupSubviews() {
        self.setupBackButton()
        self.setupLikesButton()
    }
    
    private func setupBackButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(STPhotoDetailsLikesView.touchUpInsideBackButton), for: .touchUpInside)
        button.setImage(STPhotoDetailsStyle.shared.photoLikesViewModel.backButtonImage, for: .normal)
        self.addSubview(button)
        self.backButton = button
    }
    
    @objc func touchUpInsideBackButton() {
        self.delegate?.photoLikesView(view: self, didSelectBackButton: self.backButton)
    }
    
    private func setupLikesButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = STPhotoDetailsStyle.shared.photoLikesViewModel.likesButtonBackgroundColor
        button.setImage(STPhotoDetailsStyle.shared.photoLikesViewModel.likesButtonImage, for: .normal)
        button.isEnabled = false
        button.isHidden = true
        let padding: CGFloat = 6
        button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: -padding)
        button.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: padding * 2, bottom: 0.0, right: padding * 3)
        button.layer.cornerRadius = 22
        self.addSubview(button)
        self.likesButton = button
    }
}

// MARK: - Subviews constraints configuration

extension STPhotoDetailsLikesView {
    private func setupSubviewsConstraints() {
        self.setupBackButtonConstraints()
        self.setupLikesButtonConstraints()
    }
    
    private func setupBackButtonConstraints() {
        NSLayoutConstraint.activate([
            self.backButton.heightAnchor.constraint(equalToConstant: 44),
            self.backButton.widthAnchor.constraint(equalToConstant: 44),
            self.backButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15)
        ])
    }
    
    private func setupLikesButtonConstraints() {
        NSLayoutConstraint.activate([
            self.likesButton.heightAnchor.constraint(equalToConstant: 44),
            self.likesButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.likesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
    }
}
