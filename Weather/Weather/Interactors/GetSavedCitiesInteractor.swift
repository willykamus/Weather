//
//  GetSavedCitiesInteractor.swift
//  Weather
//
//  Created by William Ching on 2022-01-07.
//

import Foundation

protocol GetSavedCitiesInteractor {
    func execute() -> [City]
}

class GetSavedCitiesInteractorImpl: GetSavedCitiesInteractor {
    
    private let cityLocalDataSource: CityLocalDataSource = CoreDataLocalDataSource()
    
    func execute() -> [City] {
        return cityLocalDataSource.getSavedCities()
    }
}
