//
//  CityRemoteDataSource.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation
import CoreLocation

protocol CityRemoteDataSource {
    func getCity(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async -> City
}

class CityRemoteDataSourceImpl: CityRemoteDataSource {
    func getCity(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async -> City {
        let location: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        do {
            let placemarks = try await CLGeocoder().reverseGeocodeLocation(location)
            if placemarks.isEmpty {
                return City(name: "")
            } else {
                return City(name: placemarks[0].locality!)
            }
        } catch {
            return City(name: "")
        }
    }
}
