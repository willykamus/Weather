//
//  Weather.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation

struct WeatherReport: Identifiable {
    var id: String
    var city: City
    var main: String
    var description: String
    var temperatureReport: TemperatureReport
    
    static func empty() -> WeatherReport {
        return WeatherReport(id: "", city: City(id: UUID(), name: "", country: ""), main: "", description: "", temperatureReport: TemperatureReport(id: "", current: Temperature.empty(), dailyHigh: Temperature.empty(), dailyLow: Temperature.empty(), feelsLike: Temperature.empty()))
    }
    
    func cityName() -> String {
        return city.name
    }
    
    func currentTemperature() -> String {
        return "\(temperatureReport.getCurrentTemperature())°C"
    }
    
    func feelsLike() -> String {
        return "\(temperatureReport.getFeelsLike())°C"
    }
}
