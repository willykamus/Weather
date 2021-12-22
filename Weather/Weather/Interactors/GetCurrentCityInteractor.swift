//
//  GetCurrentCityInteractor.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

protocol GetCurrentCityInteractor {
    func execute(location: Location) async -> City
}

class GetCurrentCityInteractorImpl: GetCurrentCityInteractor {
    func execute(location: Location) async -> City {
        let cityRemoteDataSource: CityRemoteDataSource = CityRemoteDataSourceImpl()
        return await cityRemoteDataSource.getCity(location: location)
    }
}
