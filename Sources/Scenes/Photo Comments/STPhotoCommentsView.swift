//
//  STPhotoCommentsView.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 30/07/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

protocol STPhotoCommentsDisplayLogic: class {
    func displayWillFetchPhotoComments()
    func displayDidFetchPhotoComments()
    func displayPhotoComments(viewModel: STPhotoComments.PresentComments.ViewModel)
    
    func displayEmptyState()
    
    func displayWillFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel)
    func displayDidFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel)
    func displayAvatarImage(viewModel: STPhotoComments.PresentAvatarImage.ViewModel)
}

class STPhotoCommentsView: UIView, STPhotoCommentsDisplayLogic {
    var interactor: STPhotoCommentsBusinessLogic?
    var router: (NSObjectProtocol & STPhotoCommentsRoutingLogic)?
    
    weak var accessoryView: UIVisualEffectView!
    weak var accessoryImageView: UIImageView!
    weak var commentsButton: UIButton!
    weak var tableView: UITableView!
    
    var photoId: String = ""
    var displayedComments: [STPhotoComments.DisplayedComment] = []
    
    var isExpanded: Bool = false
    
    var heightConstraint: NSLayoutConstraint?
    var height: CGFloat {
        let expandedHeight: CGFloat = UIScreen.main.bounds.height - (UIApplication.shared.statusBarFrame.size.height * 3)
        let contractedHeight: CGFloat = 50
        return self.isExpanded ? expandedHeight : contractedHeight
    }
    
    lazy var activityView: UIActivityIndicatorView = {
        var frame = self.tableView.frame
        frame.size.height = 50
        let view = UIActivityIndicatorView(frame: frame)
        view.color = UIColor.darkGray
        view.startAnimating()
        view.hidesWhenStopped = false
        return view
    }()
    
    lazy var emptyView: STPhotoCommentsEmptyView = {
        let frame = self.tableView.frame
        let view = STPhotoCommentsEmptyView(frame: frame)
        return view
    }()
    
    // MARK: - Object lifecycle
    
    init(photoId: String) {
        super.init(frame: .zero)
        self.photoId = photoId
        self.setup()
        self.setupSubviews()
        self.setupSubviewsConstraints()
        self.interactor?.setPhotoId(id: photoId)
        self.interactor?.shouldFetchPhotoComments()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        let view = self
        let interactor = STPhotoCommentsInteractor()
        let presenter = STPhotoCommentsPresenter()
        let router = STPhotoCommentsRouter()
        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.displayer = view
    }
    
    func displayPhotoCommentCount(title: String) {
        let attributes = self.isExpanded ? STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonExpandedState.textAttributes : STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonContractedState.textAttributes
        self.commentsButton?.setAttributedTitle(NSAttributedString(string: title, attributes: attributes), for: .normal)
    }
}

// MARK: - Display logic

extension STPhotoCommentsView {
    func displayWillFetchPhotoComments() {
        DispatchQueue.main.async {
            self.tableView?.tableFooterView = self.activityView
        }
    }
    
    func displayDidFetchPhotoComments() {
        DispatchQueue.main.async {
            self.tableView?.tableFooterView = nil
        }
    }
    
    func displayPhotoComments(viewModel: STPhotoComments.PresentComments.ViewModel) {
        DispatchQueue.main.async {
            self.tableView?.performBatchUpdates({
                let index = self.displayedComments.count
                let indexPaths = viewModel.items.enumerated().map({ IndexPath(row: index + $0.offset, section: 0) })
                self.displayedComments.append(contentsOf: viewModel.items)
                self.tableView?.insertRows(at: indexPaths, with: .none)
            }, completion: nil)
        }
    }
    
    func displayEmptyState() {
        DispatchQueue.main.async {
            self.tableView?.backgroundView = self.emptyView
        }
    }
    
    func displayWillFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel) {
        DispatchQueue.main.async {
            viewModel.displayedComment.isLoadingUserImage = true
            viewModel.displayedComment.cellInterface?.setIsLoadingUserAvatar(isLoading: true)
        }
    }
    
    func displayDidFetchAvatarImage(viewModel: STPhotoComments.FetchAvatarImage.ViewModel) {
        DispatchQueue.main.async {
            viewModel.displayedComment.isLoadingUserImage = false
            viewModel.displayedComment.cellInterface?.setIsLoadingUserAvatar(isLoading: false)
        }
    }
    
    func displayAvatarImage(viewModel: STPhotoComments.PresentAvatarImage.ViewModel) {
        DispatchQueue.main.async {
            viewModel.displayedComment.avatarImage = viewModel.image
            viewModel.displayedComment.cellInterface?.setAvatarImage(image: viewModel.image)
        }
    }
}

// MARK: - Table view data source

extension STPhotoCommentsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.displayedComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.displayedComments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: STPhotoCommentsViewCell.cellReuseIdentifier, for: indexPath) as? STPhotoCommentsViewCell ?? STPhotoCommentsViewCell()
        item.cellInterface = cell
        cell.setIsLoadingUserAvatar(isLoading: item.isLoadingUserImage)
        cell.setAvatarImage(image: item.avatarImage)
        cell.setName(name: item.name)
        cell.setTime(time: item.time)
        cell.setComment(comment: item.text)
        self.interactor?.shouldFetchAvatarImage(request: STPhotoComments.FetchAvatarImage.Request(displayedComment: item))
        return cell
    }
}

// MARK: - Table view delegate

extension STPhotoCommentsView: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y.rounded(.up)
        let maximumOffset = (scrollView.contentSize.height - scrollView.frame.size.height).rounded(.up)
        if currentOffset == maximumOffset && scrollView.isDecelerating {
            self.interactor?.shouldFetchPhotoComments()
        }
    }
}

// MARK: - Actions

extension STPhotoCommentsView {
    @objc func touchUpInsideCommentsButton() {
        self.isExpanded = !self.isExpanded
        
        let animations: () -> Void = {
            self.isExpanded ? self.setExpandedState() : self.setContractedState()
            self.heightConstraint?.constant = self.height
            self.superview?.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [.curveLinear, .allowUserInteraction], animations: animations, completion: nil)
    }
    
    private func setExpandedState() {
        self.updateAccessoryImage(image: STPhotoCommentsStyle.shared.commentsViewModel.expandedAccessoryImage)
        self.updateCommentsButtonImage(image: STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonExpandedState.image)
        self.updateCommentsButtonTitleAttributes(attributes: STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonExpandedState.textAttributes)
    }
    
    private func setContractedState() {
        self.updateAccessoryImage(image: STPhotoCommentsStyle.shared.commentsViewModel.contractedAccessoryImage)
        self.updateCommentsButtonImage(image: STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonContractedState.image)
        self.updateCommentsButtonTitleAttributes(attributes: STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonContractedState.textAttributes)
    }
    
    private func updateCommentsButtonTitleAttributes(attributes: [NSAttributedString.Key: Any]) {
        if let attributedTitle = self.commentsButton?.attributedTitle(for: .normal) {
            self.commentsButton?.setAttributedTitle(NSAttributedString(string: attributedTitle.string, attributes: attributes), for: .normal)
        }
    }
    
    private func updateCommentsButtonImage(image: UIImage) {
        self.commentsButton?.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    private func updateAccessoryImage(image: UIImage) {
        self.accessoryImageView?.image = image
    }
}

// MARK: - Subviews configuration

extension STPhotoCommentsView {
    private func setupSubviews() {
        self.setupAccessoryView()
        self.setupCommentsButton()
        self.setupAccessoryImageView()
        self.setupTableView()
    }
    
    private func setupAccessoryView() {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.accessoryView = view
    }
    
    private func setupAccessoryImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = STPhotoCommentsStyle.shared.commentsViewModel.contractedAccessoryImage
        self.accessoryView?.contentView.addSubview(imageView)
        self.accessoryImageView = imageView
    }
    
    private func setupCommentsButton() {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonContractedState.image.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(STPhotoCommentsView.touchUpInsideCommentsButton), for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        button.layer.borderWidth = 1 / UIScreen.main.scale
        button.layer.borderColor = STPhotoCommentsStyle.shared.commentsViewModel.commentsButtonContractedState.borderColor.cgColor
        self.accessoryView?.contentView.addSubview(button)
        self.commentsButton = button
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(STPhotoCommentsViewCell.self, forCellReuseIdentifier: STPhotoCommentsViewCell.cellReuseIdentifier)
        self.addSubview(tableView)
        self.tableView = tableView
    }
}

// MARK: - Constraints configuration

extension STPhotoCommentsView {
    private func setupSubviewsConstraints() {
        self.setupHeightConstraint()
        self.setupAccessoryViewConstraints()
        self.setupCommentsButtonConstraints()
        self.setupAccessoryImageViewConstraints()
        self.setupTableViewConstraints()
    }
    
    private func setupHeightConstraint() {
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: self.height)
        self.heightConstraint?.isActive = true
    }
    
    private func setupAccessoryViewConstraints() {
        NSLayoutConstraint.activate([
            self.accessoryView.topAnchor.constraint(equalTo: self.topAnchor),
            self.accessoryView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.accessoryView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.accessoryView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupCommentsButtonConstraints() {
        NSLayoutConstraint.activate([
            self.commentsButton.topAnchor.constraint(equalTo: self.accessoryView.contentView.topAnchor),
            self.commentsButton.bottomAnchor.constraint(equalTo: self.accessoryView.contentView.bottomAnchor),
            self.commentsButton.leadingAnchor.constraint(equalTo: self.accessoryView.contentView.leadingAnchor),
            self.commentsButton.trailingAnchor.constraint(equalTo: self.accessoryView.contentView.trailingAnchor)
        ])
    }
    
    private func setupAccessoryImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.accessoryImageView.centerYAnchor.constraint(equalTo: self.accessoryView.contentView.centerYAnchor),
            self.accessoryImageView.trailingAnchor.constraint(equalTo: self.accessoryView.contentView.trailingAnchor, constant: -15),
            self.accessoryImageView.widthAnchor.constraint(equalToConstant: 10),
            self.accessoryImageView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.accessoryView.bottomAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
