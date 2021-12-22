//
//  LocationManager.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation
import CoreLocation

class LocationSingleton: NSObject, CLLocationManagerDelegate {
    
    static let shared: LocationSingleton = LocationSingleton()
    private let locationManager: CLLocationManager = CLLocationManager()
    private var location: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func requestLocation() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
