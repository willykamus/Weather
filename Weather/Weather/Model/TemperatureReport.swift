//
//  TemperatureReport.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

struct TemperatureReport: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var currentReport: CurrentTemperatureReport
    var dailyReport: DailyTemperatureReport
    var hourly: HourlyTemperatureReport
}

struct CurrentTemperatureReport: Hashable {
    var current: Temperature
    var feelsLike: Temperature
}

struct DailyTemperatureReport: Hashable {
    var dailyLow: Temperature
    var dailyHigh: Temperature
}

struct HourlyTemperatureReport: Hashable {
    var hourly: [Temperature]
}
