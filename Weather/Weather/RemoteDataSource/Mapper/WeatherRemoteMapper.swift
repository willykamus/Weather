//
//  WeatherRemoteMapper.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

class WeatherRemoteMapper {
    func toWeather(remoteEntity: FullWeatherRemoteResponse) -> WeatherReport {
        let temperatureReport = TemperatureReport(id: UUID().uuidString, current: Temperature(value: remoteEntity.main.temp, type: .current), dailyHigh: Temperature(value: remoteEntity.main.temp_max, type: .dailyHigh), dailyLow: Temperature(value: remoteEntity.main.temp_min, type: .dailyLow), feelsLike: Temperature(value: remoteEntity.main.feels_like, type: .feelsLike))
        return WeatherReport(id: String(remoteEntity.weather[0].id), main: remoteEntity.weather[0].main, description: remoteEntity.weather[0].description, temperatureReport: temperatureReport)
    }
}
