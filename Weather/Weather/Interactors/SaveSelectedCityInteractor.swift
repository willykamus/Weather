//
//  SaveSelectedCityInteractor.swift
//  Weather
//
//  Created by William Ching on 2022-01-06.
//

import Foundation

protocol SaveSelectedCityInteractor {
    func execute(city: City)
}

class SaveSelectedCityInteractorImpl: SaveSelectedCityInteractor {
    
    let cityLocalDataSource: CityLocalDataSource = CoreDataLocalDataSource()
    
    func execute(city: City) {
        cityLocalDataSource.save(city: city)
    }
}
