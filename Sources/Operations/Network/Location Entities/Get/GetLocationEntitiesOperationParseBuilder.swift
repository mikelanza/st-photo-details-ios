//
//  GetLocationEntitiesOperationParseBuilder.swift
//  STPhotoDetails-iOS
//
//  Created by Dimitri Strauneanu on 05/08/2019.
//  Copyright © 2019 mikelanza. All rights reserved.
//

import Foundation
import STPhotoCore

class GetLocationEntitiesOperationParseBuilder {
    private let dictionary: NSDictionary
    private var completionHandler: (Result<GetLocationEntitiesOperationModel.Response, OperationError>) -> Void
    
    var entities: [EntityLevel : GeoEntity] = [:]
    var error: OperationError?
    
    init(dictionary: NSDictionary, completionHandler: @escaping (Result<GetLocationEntitiesOperationModel.Response, OperationError>) -> Void) {
        self.dictionary = dictionary
        self.completionHandler = completionHandler
    }
    
    func parseResponse() {
        let queue = OperationQueue()
        let completionOperation = self.completionOperation()
        self.parseEntities()
        queue.addOperation(completionOperation)
    }
    
    private func completionOperation() -> BlockOperation {
        return BlockOperation {
            if let error = self.error {
                self.completionHandler(Result.failure(error))
            } else {
                self.completionHandler(Result.success(GetLocationEntitiesOperationModel.Response(entities: self.entities)))
            }
        }
    }
    
    private func parseEntities() {
        for (key, item) in self.dictionary {
            if let entityLevel = EntityLevel(rawValue: key as? String ?? ""), let entityJSON = item as? NSDictionary,
                let entity = self.parseEntityJSON(entityJSON, entityLevel: entityLevel) {
                self.entities[entityLevel] = entity
            }
        }
    }
    
    private func parseEntityJSON(_ json: NSDictionary, entityLevel: EntityLevel) -> GeoEntity? {
        guard let id = json[Keys.id] as? Int,
            let center = self.getCenterCoordinate(json: json),
            let boundingBox = self.getBoundingBox(json: json) else {
                return nil
        }
        
        let name = json[Keys.name] as? String
        let area = json[Keys.area] as? Double ?? 0
        let geoJSONPolygons = self.getGeoJSONPolygon(json: json)
        
        var entity = GeoEntity(id: id, boundingBox: boundingBox)
        entity.name = name
        entity.entityLevel = entityLevel
        entity.center = center
        entity.geoJSONPolygons = geoJSONPolygons
        entity.area = area
        return entity
    }
    
    private func getCenterCoordinate(json: NSDictionary) -> Coordinate? {
        guard let centerJSON = json[Keys.center] as? NSDictionary, let centerLatitude = centerJSON[Keys.latitude] as? Double, let centerLongitude = centerJSON[Keys.longitude] as? Double else {
            return nil
        }
        return Coordinate(longitude: centerLongitude, latitude: centerLatitude)
    }
    
    private func getBoundingBox(json: NSDictionary) -> BoundingBox? {
        guard let bboxJSON = json[Keys.boundingBox] as? NSDictionary,
            let north = bboxJSON[Keys.north] as? Double, let east = bboxJSON[Keys.east] as? Double,
            let south = bboxJSON[Keys.south] as? Double, let west = bboxJSON[Keys.west] as? Double else {
                return nil
        }
        let boundingCoordinates = BoundingCoordinates(west, south, east, north)
        return BoundingBox(boundingCoordinates: boundingCoordinates)
    }
    
    private func getGeoJSONPolygon(json: NSDictionary) -> Array<GeoJSONPolygon> {
        var geoJSONPolygons = Array<GeoJSONPolygon>()
        let geoJSONObject:  GeoJSONObject? = getGeoJSONObject(json: json)
        switch geoJSONObject {
            case let multiPolygon as GeoJSONMultiPolygon: geoJSONPolygons.append(contentsOf: multiPolygon.polygons); break
            case let polygon as GeoJSONPolygon: geoJSONPolygons.append(polygon); break
            default: break
        }
        return geoJSONPolygons
    }
    
    private func getGeoJSONObject(json: NSDictionary) -> GeoJSONObject? {
        guard let geometryString = json[Keys.geometry] as? String else { return nil }
        
        do {
            let geometry = try WKTReader().read(string: geometryString)
            return geometry
        } catch {
            print(error)
        }
        return nil
    }
    
    private struct Keys {
        static let id = "id",
        center = "center",
        geometry = "geom",
        boundingBox = "bbox",
        latitude = "lat",
        longitude = "lng",
        north = "north",
        east = "east",
        south = "south",
        west = "west",
        name = "name",
        area = "area"
    }
}
