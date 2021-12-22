//
//  LocationViewModel.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    @Published var location: Location?
    @Published var currentCity: City?
    
    private let getCurrentLocationInteractor: GetCurrentLocationInteractor = GetCurrentLocationInteractorImpl()
    private let getCurrentCityInteractor: GetCurrentCityInteractor = GetCurrentCityInteractorImpl()
    private let requestLocationInteractor: RequestLocationInteractor = RequestLocationInteractorImpl()
    
    func getCurrentLocation() {
        self.getCurrentLocationInteractor.execute { location in
            self.location = location
            Task {
                await self.getCurrentCity()
            }
        }
    }
    func getCurrentCity() async {
        guard let location = location else {
            return
        }
        
        let city = await getCurrentCityInteractor.execute(location: location)
        
        DispatchQueue.main.async {
            self.currentCity = city
        }
    }
    func requestLocation() {
        self.requestLocationInteractor.execute()
    }
}
