//
//  STPhotoDetailsSpaceCell.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 01/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

class STPhotoDetailsSpaceCell: UITableViewCell {
    static let cellReuseIdentifier = "STPhotoDetailsSpaceCell"
    
    weak var spaceView: UIView!
    weak var spaceViewHeightConstraint: NSLayoutConstraint?
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: STPhotoDetailsSpaceCell.cellReuseIdentifier)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
        self.setupSpaceView()
        self.setupSpaceViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeight(height: CGFloat) {
        self.spaceViewHeightConstraint?.constant = height
    }
    
    private func setupCell() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.white
    }
    
    private func setupSpaceView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)
        self.spaceView = view
    }
    
    private func setupSpaceViewConstraints() {
        self.spaceViewHeightConstraint = self.spaceView?.heightAnchor.constraint(equalToConstant: 0)
        self.spaceViewHeightConstraint?.priority = UILayoutPriority.init(999)
        self.spaceViewHeightConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            self.spaceView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.spaceView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.spaceView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.spaceView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
}
