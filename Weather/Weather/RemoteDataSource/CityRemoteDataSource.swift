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
    func getCoordinates(city: City) async -> CLLocation
}

class CityRemoteDataSourceImpl: CityRemoteDataSource {
    func getCity(location: Location) async -> City {
        let location: CLLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        do {
            let placemarks = try await CLGeocoder().reverseGeocodeLocation(location)
            if placemarks.isEmpty {
                return City(id: UUID(), name: "", country: "")
            } else {
                return City(id: UUID(), name: placemarks[0].locality!, country: "")
            }
        } catch {
            return City(id: UUID(), name: "", country: "")
        }
    }
    
    func getCoordinates(city: City) async -> CLLocation {
        let geocoder = CLGeocoder()
        do {
            let placemarks = try await geocoder.geocodeAddressString("\(city.name), \(city.country)")
            if let placemark = placemarks.first {
                return placemark.location!
            }
            return CLLocation(latitude: 0.0, longitude: 0.0)
        } catch {
            return CLLocation(latitude: 0.0, longitude: 0.0)
        }
    }
}
