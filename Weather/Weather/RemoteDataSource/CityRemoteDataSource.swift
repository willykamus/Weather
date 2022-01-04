//
//  CityRemoteDataSource.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation
import CoreLocation

protocol CityRemoteDataSource {
    func getCity(location: Location) async -> City
}

class CityRemoteDataSourceImpl: CityRemoteDataSource {
    func getCity(location: Location) async -> City {
        let location: CLLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        do {
            let placemarks = try await CLGeocoder().reverseGeocodeLocation(location)
            if placemarks.isEmpty {
                return City(name: "", country: "")
            } else {
                return City(name: placemarks[0].locality!, country: "")
            }
        } catch {
            return City(name: "", country: "")
        }
    }
}
