//
//  WeatherRemoteDataSource.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation
import CoreLocation

protocol WeatherRemoteDataSource {
    func getCurrentWeather(latitude: Double, longitude: Double) async -> WeatherReport
}

class WeatherRemoteDataSourceImpl: WeatherRemoteDataSource {
    
    let apiKey: String = "dd263f24d16ae14fb0414215a3c979d0"
    let urlString: String = "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}&units=metric"
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async -> WeatherReport {
        let urlWithLatitude = urlString.replacingOccurrences(of: "{lat}", with: String(latitude))
        let urlWithLongitude = urlWithLatitude.replacingOccurrences(of: "{lon}", with: String(longitude))
        let finalURL = urlWithLongitude.replacingOccurrences(of: "{API key}", with: self.apiKey)
        
        guard let url: URL = URL(string: finalURL) else {
            return WeatherReport.empty()
        }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(from: url)
            let remoteEntity = try JSONDecoder().decode(FullWeatherRemoteResponse.self, from: data)
            return WeatherRemoteMapper().toWeather(remoteEntity: remoteEntity)
        } catch {
            return WeatherReport.empty()
        }
    }
}


