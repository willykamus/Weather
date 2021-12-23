//
//  WeatherResponse.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

struct FullWeatherRemoteResponse: Decodable {
    var coord: CoordinatesRemoteResponse
    var weather: [WeatherRemoteResponse]
    var main: MainRemoteResponse
    var name: String
    var wind: WindRemoteResponse
    
}

struct CoordinatesRemoteResponse: Decodable {
    var lon: Double
    var lat: Double
}

struct WeatherRemoteResponse: Decodable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}

struct MainRemoteResponse: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct WindRemoteResponse: Decodable {
    var speed: Double
    var deg: Double
}
