//
//  GetImageOperationModel.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import UIKit

enum GetImageOperationModel {
    struct Request {
        let imageUrl: String?
    }
    
    struct Response {
        let image: UIImage?
    }
}
