//
//  LocationViewModel.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation
import CoreLocation

class LocationSingleton: NSObject, CLLocationManagerDelegate {
    
    static let shared: LocationSingleton = LocationSingleton()
    private let locationManager: CLLocationManager = CLLocationManager()
    private var completion: ((Location) -> Void)?
    
    @Published var location: Location?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestLocation() {
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = Location(latitude: locations.first?.coordinate.latitude ?? 0.0, longitude: locations.first?.coordinate.longitude ?? 0.0)
        completion?(self.location!)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func getCurrentLocation(completion: @escaping ((Location) -> Void)) {
        self.completion = completion
        self.locationManager.startUpdatingLocation()
    }
}
