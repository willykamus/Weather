//
//  GetCurrentLocationInteractor.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

protocol GetCurrentLocationInteractor {
    func execute(completion: @escaping ((Location) -> Void))
}

class GetCurrentLocationInteractorImpl: GetCurrentLocationInteractor {
    func execute(completion: @escaping ((Location) -> Void)) {
        let locationManager = LocationSingleton.shared
        return locationManager.getCurrentLocation(completion: completion)
    }
}
