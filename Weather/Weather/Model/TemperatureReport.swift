//
//  TemperatureReport.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

struct TemperatureReport: Identifiable, Hashable {

    var id: String = UUID().uuidString
    var current: Temperature
    var dailyHigh: Temperature
    var dailyLow: Temperature
    var feelsLike: Temperature
    
    func getCurrentTemperature() -> String {
        return String(format: "%.0f", round(self.current.value))
    }
    
    func getDailyHigh() -> String {
        return String(format: "%.0f", round(self.dailyHigh.value))
    }
    
    func getDailyLow() -> String {
        return String(format: "%.0f", round(self.dailyLow.value))
    }
    
    func getFeelsLike() -> String {
        return String(format: "%.0f", round(self.feelsLike.value))
    }
}
