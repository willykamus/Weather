//
//  GetSearchCitiesInteractor.swift
//  Weather
//
//  Created by William Ching on 2022-01-02.
//

import Foundation

protocol GetSearchCitiesInteractor {
    func execute(text: String) -> [City]
}

class GetSearchCitiesInteractorImpl: GetSearchCitiesInteractor {
    
    let localDataSource: CityLocalDataSource = CoreDataLocalDataSource()
    
    func execute(text: String) -> [City] {
        return localDataSource.get(string: text)
    }
}
