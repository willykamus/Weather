//
//  TemperatureReport.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

struct TemperatureReport: Identifiable {
    var id: String = UUID().uuidString
    var current: Temperature
    var dailyHigh: Temperature
    var dailyLow: Temperature
    var feelsLike: Temperature
}
