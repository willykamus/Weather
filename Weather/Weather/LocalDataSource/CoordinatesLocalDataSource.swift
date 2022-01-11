//
//  CoordinatesLocalDataSource.swift
//  Weather
//
//  Created by William Ching on 2022-01-10.
//

import Foundation
import CoreLocation

protocol CoordinatesLocalDataSource {
    func get(city: City) async -> Location
}

class CoordinatesLocalDataSourceImpl: CoordinatesLocalDataSource {
    func get(city: City) async -> Location {
        let cLGeocoder = CLGeocoder()
        do {
            let placemark = try await cLGeocoder.geocodeAddressString(buildAddress(city: city))
            if let location = placemark.first?.location?.coordinate {
                return Location(latitude: location.latitude, longitude: location.longitude)
            }
            return Location(latitude: 0.0, longitude: 0.0)
        } catch {
            print(error.localizedDescription)
            return Location(latitude: 0.0, longitude: 0.0)
        }
    }
    
    private func buildAddress(city: City) -> String {
        return "\(city.name), \(city.country)"
    }
}
