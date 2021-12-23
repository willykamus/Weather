//
//  GetCurrentWeatherInteractor.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

protocol GetCurrentWeatherInteractor {
    func execute(location: Location) async -> Weather
}

class GetCurrentWeatherInteractorImpl: GetCurrentWeatherInteractor {
    
    func execute(location: Location) async -> Weather {
        let weatherRemoteDataSource: WeatherRemoteDataSource = WeatherRemoteDataSourceImpl()
        let weather = await weatherRemoteDataSource.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
        return await weatherRemoteDataSource.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
    }
}
