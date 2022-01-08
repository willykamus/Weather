//
//  Temperature.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

struct Temperature: Hashable {
    var value: Double
    var type: TemperatureType
    
    static func empty() -> Temperature {
        return Temperature(value: 0.0, type: .na)
    }
}

enum TemperatureType {
    case dailyHigh
    case dailyLow
    case feelsLike
    case current
    case na
}
