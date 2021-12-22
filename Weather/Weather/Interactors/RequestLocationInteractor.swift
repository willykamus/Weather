//
//  RequestLocationInteractor.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation

protocol RequestLocationInteractor {
    func execute()
}

class RequestLocationInteractorImpl: RequestLocationInteractor {
    
    func execute() {
        let locationManager = LocationSingleton.shared
        locationManager.requestLocation()
    }
}
