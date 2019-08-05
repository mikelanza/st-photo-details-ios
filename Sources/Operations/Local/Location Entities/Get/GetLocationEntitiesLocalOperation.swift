//
//  GetLocationEntitiesLocalOperation.swift
//  STPhotoDetails-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation
import STPhotoCore

class GetLocationEntitiesLocalOperation: AsynchronousOperation {
    private let model: GetLocationEntitiesOperationModel.Request
    private var operationCompletionHandler: (Result<GetLocationEntitiesOperationModel.Response, OperationError>) -> Void
    
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1...3)
    
    init(model: GetLocationEntitiesOperationModel.Request, completionHandler: @escaping (Result<GetLocationEntitiesOperationModel.Response, OperationError>) -> Void) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(self.delay)) {
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                self.successBlock(response: GetLocationEntitiesOperationModel.Response(entities: self.entities()))
            }
        }
    }
    
    private func entities() -> [EntityLevel: GeoEntity] {
        return [
            EntityLevel.block: self.entity(id: 1, entityLevel: EntityLevel.block, name: "Block 1"),
            EntityLevel.neighborhood: self.entity(id: 2, entityLevel: EntityLevel.neighborhood, name: "Neighborhood 2"),
            EntityLevel.city: self.entity(id: 3, entityLevel: EntityLevel.city, name: "City 3"),
            EntityLevel.county: self.entity(id: 4, entityLevel: EntityLevel.county, name: "County 4"),
            EntityLevel.state: self.entity(id: 5, entityLevel: EntityLevel.state, name: "State 5"),
            EntityLevel.country: self.entity(id: 6, entityLevel: EntityLevel.country, name: "Country 6")
        ]
    }
    
    private func entity(id: Int, entityLevel: EntityLevel, name: String) -> GeoEntity {
        var entity = GeoEntity(id: id, boundingBox: BoundingBox(boundingCoordinates: (50, 50, 60, 60)))
        entity.name = name
        entity.entityLevel = entityLevel
        return entity
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetLocationEntitiesOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
