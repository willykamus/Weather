//
//  LocationViewModel.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    @Published var location: Location?
    
    private let getCurrentLocationInteractor: GetCurrentLocationInteractor = GetCurrentLocationInteractorImpl()
    private let requestLocationInteractor: RequestLocationInteractor = RequestLocationInteractorImpl()
    
    func getCurrentLocation() {
        self.getCurrentLocationInteractor.execute { location in
            self.location = location
        }
    }
    
    func requestLocation() {
        self.requestLocationInteractor.execute()
    }
}
