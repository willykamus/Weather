//
//  Temperature.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

protocol TemperatureModel {
    var value: Double { get set }
    var date: Date { get set }
}

struct Temperature: TemperatureModel, Hashable {
    var value: Double
    var date: Date
    
    static func empty() -> Temperature {
        return Temperature(value: 0.0, date: Date(timeIntervalSince1970: 0))
    }
    
}

//struct Temperature: Hashable {
//    var value: Double
//    var type: TemperatureType
//
//    static func empty() -> Temperature {
//        return Temperature(value: 0.0, type: .na)
//    }
//}

//enum TemperatureType {
//    case dailyHigh
//    case dailyLow
//    case feelsLike
//    case current
//    case hourly
//    case na
//}
//
//struct FeelsLikeTemperature: Temperature {
//    var value: Double
//}
//
//struct HourlyTemperature: Temperature, Hashable {
//    var value: Double
//    var date: Date
//}
