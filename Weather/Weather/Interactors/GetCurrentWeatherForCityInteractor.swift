//
//  GetCurrentWeatherForCityInteractor.swift
//  Weather
//
//  Created by William Ching on 2022-01-07.
//

import Foundation

protocol GetCurrentWeatherForCityInteractor {
    func execute(city: City) async -> WeatherReport
}

class GetCurrentWeatherForCityInteractorImpl: GetCurrentWeatherForCityInteractor {
    
    func execute(city: City) async -> WeatherReport {
        let weatherRemoteDataSource: WeatherRemoteDataSource = WeatherRemoteDataSourceImpl()
        return await weatherRemoteDataSource.getCurrentWeather(city: city)
    }
}
