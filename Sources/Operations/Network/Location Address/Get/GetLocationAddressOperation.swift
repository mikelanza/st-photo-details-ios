//
//  GetLocationAddressOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 04/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import CoreLocation
import Contacts
import STPhotoCore

class GetLocationAddressOperation: AsynchronousOperation {
    private let model: GetLocationAddressOperationModel.Request
    private var operationCompletionHandler: (Result<GetLocationAddressOperationModel.Response, OperationError>) -> Void
    
    init(model: GetLocationAddressOperationModel.Request, completionHandler: @escaping (Result<GetLocationAddressOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().async {
            let geocoder = CLGeocoder()
            let location = CLLocation(latitude: self.model.location.latitude, longitude: self.model.location.latitude)
            geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) in
                if let placemark = placemarks?.first {
                    self.successfulResultBlock(address: self.transform(placemark: placemark))
                } else {
                    self.noDataAvailableErrorBlock()
                }
            })
        }
    }
    
    private func transform(placemark: CLPlacemark) -> STAddress {
        var address = STAddress()
        address.location = self.model.location
        address.street = placemark.postalAddress?.street
        address.city = placemark.postalAddress?.city
        address.state = placemark.postalAddress?.state
        address.country = placemark.postalAddress?.country
        return address
    }
    
    // MARK: - Successful result
    
    private func successfulResultBlock(address: STAddress) {
        self.operationCompletionHandler(Result.success(GetLocationAddressOperationModel.Response(address: address)))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
