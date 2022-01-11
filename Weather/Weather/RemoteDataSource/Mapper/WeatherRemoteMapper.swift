//
//  WeatherRemoteMapper.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

class WeatherRemoteMapper {
    
    func toWeather(oneCallResponse: OneCallResponse, city: City) -> WeatherReport {
        var hourlyReport: [Temperature] = []
        for i in 1..<6 {
            hourlyReport.append(Temperature(value: oneCallResponse.hourly[i].temp, date: Date(timeIntervalSince1970: oneCallResponse.hourly[i].dt)))
        }
        let currentTemperature = oneCallResponse.current
        let currentReport = CurrentTemperatureReport(current: Temperature(value: currentTemperature.temp, date: Date()), feelsLike: Temperature(value: currentTemperature.feels_like, date: Date()))
        let dailyTemperature = oneCallResponse.daily.first!
        let dailyReport = DailyTemperatureReport(dailyLow: Temperature(value: dailyTemperature.temp.min, date: Date(timeIntervalSince1970: dailyTemperature.dt)), dailyHigh: Temperature(value: dailyTemperature.temp.max, date: Date(timeIntervalSince1970: dailyTemperature.dt)))
        let currentWeather = oneCallResponse.current.weather.first!
        let currentWeatherDescription = CurrentWeatherDescription(id: currentWeather.id, main: currentWeather.main, description: currentWeather.description)
        return WeatherReport(city: city, currentWeatherDescription: currentWeatherDescription, temperatureReport: TemperatureReport(currentReport: currentReport, dailyReport: dailyReport, hourly: HourlyTemperatureReport(hourly: hourlyReport)))
        
    }

}
