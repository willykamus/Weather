//
//  Weather.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation

struct WeatherReport: Identifiable {
    var id: String
    var main: String
    var description: String
    var temperatureReport: TemperatureReport
    
    static func empty() -> WeatherReport {
        return WeatherReport(id: "", main: "", description: "", temperatureReport: TemperatureReport(id: "", current: Temperature.empty(), dailyHigh: Temperature.empty(), dailyLow: Temperature.empty(), feelsLike: Temperature.empty()))
    }
}
