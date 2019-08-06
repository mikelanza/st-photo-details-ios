//
//  STPhotoDetailsViewController.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 24/06/2019.
//  Copyright (c) 2019 Streetography. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

public class STPhotoDetailsViewController: UIViewController, STPhotoDetailsDisplayLogic {
    weak var photoLikesView: STPhotoDetailsLikesView!
    weak var tableView: UITableView!
    weak var photoCommentsView: STPhotoCommentsView!
    
    var interactor: STPhotoDetailsBusinessLogic?
    var router: (NSObjectProtocol & STPhotoDetailsRoutingLogic)?
    
    var photoId: String = ""
    var displayedItems: [STPhotoDetails.Item] = []
    
    lazy var activityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: self.view.frame)
        view.color = UIColor.lightGray
        view.startAnimating()
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    // MARK: - Object lifecycle
    
    public convenience init(photoId: String) {
        self.init(nibName: nil, bundle: nil)
        self.photoId = photoId
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = STPhotoDetailsInteractor()
        let presenter = STPhotoDetailsPresenter()
        let router = STPhotoDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.displayer = viewController
        router.viewController = viewController
    }
    
    // MARK: - View lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor?.setPhotoId(id: self.photoId)
        self.setupSubviews()
        self.setupSubviewsConstraints()
        self.interactor?.shouldFetchPhoto()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Photo likes view delegate

extension STPhotoDetailsViewController: STPhotoDetailsLikesViewDelegate {
    func photoLikesView(view: STPhotoDetailsLikesView?, didSelectBackButton button: UIButton?) {
        self.router?.removeViewController()
    }
}