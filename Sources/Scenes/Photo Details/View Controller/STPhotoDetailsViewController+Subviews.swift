//
//  STPhotoDetailsViewController+Subviews.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 25/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

extension STPhotoDetailsViewController {
    func setupSubviews() {
        self.setupView()
        self.setupTableView()
        self.setupPhotoLikesView()
        self.setupPhotoCommentsView()
    }
    
    private func setupView() {
        self.view.backgroundColor = UIColor(red: 54/255, green: 62/255, blue: 75/255, alpha: 1)
    }
    
    private func setupPhotoLikesView() {
        let view = STPhotoDetailsLikesView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        self.photoLikesView = view
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        tableView.register(STPhotoDetailsImageCell.self, forCellReuseIdentifier: STPhotoDetailsImageCell.cellReuseIdentifier)
        tableView.register(STPhotoDetailsInfoCell.self, forCellReuseIdentifier: STPhotoDetailsInfoCell.cellReuseIdentifier)
        tableView.register(STPhotoDetailsEntityCell.self, forCellReuseIdentifier: STPhotoDetailsEntityCell.cellReuseIdentifier)
        tableView.register(STPhotoDetailsSpaceCell.self, forCellReuseIdentifier: STPhotoDetailsSpaceCell.cellReuseIdentifier)
        self.view.addSubview(tableView)
        self.tableView = tableView
    }
    
    private func setupPhotoCommentsView() {
        let view = STPhotoCommentsView(photoId: self.photoId)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        self.photoCommentsView = view
    }
}

extension STPhotoDetailsViewController {
    func setupSubviewsConstraints() {
        self.setupPhotoLikesViewConstraints()
        self.setupTableViewConstraints()
        self.setupPhotoCommentsViewConstraints()
    }
    
    private func setupPhotoLikesViewConstraints() {
        NSLayoutConstraint.activate([
            self.photoLikesView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.photoLikesView.heightAnchor.constraint(equalToConstant: 80),
            self.photoLikesView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.photoLikesView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    private func setupPhotoCommentsViewConstraints() {
        NSLayoutConstraint.activate([
            self.photoCommentsView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.photoCommentsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.photoCommentsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
}
