//
//  Weather.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation

struct WeatherReport: Identifiable, Hashable  {

    var id: String = UUID().uuidString
    var city: City
    var currentWeatherDescription: CurrentWeatherDescription
    var temperatureReport: TemperatureReport
    
    static func empty() -> WeatherReport {
        return WeatherReport(city: City(id: UUID(), name: "", country: ""), currentWeatherDescription: CurrentWeatherDescription(id: 0.0, main: "", description: ""), temperatureReport: TemperatureReport(currentReport: CurrentTemperatureReport(current: Temperature.empty(), feelsLike: Temperature.empty()), dailyReport: DailyTemperatureReport(dailyLow: Temperature.empty(), dailyHigh: Temperature.empty()), hourly: HourlyTemperatureReport(hourly: [])))
    }
    
    func firstHourFromNow() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "KKa"
        return formatter.string(from: temperatureReport.hourly.hourly[0].date)
    }
    
    func firstTemperatureFromNow() -> String {
        return String(temperatureReport.hourly.hourly[0].value)
    }
    
    func secondHourFromNow() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hha"
        return formatter.string(from: temperatureReport.hourly.hourly[1].date)
    }
    
    func secondTemperatureFromNow() -> String {
        return String(temperatureReport.hourly.hourly[1].value)
    }
    
    func thirdHourFromNow() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hha"
        return formatter.string(from: temperatureReport.hourly.hourly[2].date)
    }
    
    func thirdTemperatureFromNow() -> String {
        return String(temperatureReport.hourly.hourly[2].value)
    }
    
    func forthHourFromNow() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hha"
        return formatter.string(from: temperatureReport.hourly.hourly[3].date)
    }
    
    func forthTemperatureFromNow() -> String {
        return String(temperatureReport.hourly.hourly[3].value)
    }
    
    func fifthHourFromNow() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hha"
        return formatter.string(from: temperatureReport.hourly.hourly[4].date)
    }
    
    func fifthTemperatureFromNow() -> String {
        return String(temperatureReport.hourly.hourly[4].value)
    }
    
    func currentTemperature() -> String {
        return String(temperatureReport.currentReport.current.value)
    }
    
    func currentFeelsLikeTemperature() -> String {
        return String(temperatureReport.currentReport.feelsLike.value)
    }
    
    func cityName() -> String {
        return city.name
    }
    
    func currentWeatherDescriptionString() -> String {
        return currentWeatherDescription.description
    }
}

struct CurrentWeatherDescription: Identifiable, Hashable {
    var id: Double
    var main: String
    var description: String
}
