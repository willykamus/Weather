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
    func getCurrentWeather(city: City) async -> WeatherReport
}

class WeatherRemoteDataSourceImpl: WeatherRemoteDataSource {

    private let apiKey: String = "dd263f24d16ae14fb0414215a3c979d0"
    private let urlString: String = "https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}&units=metric"
    private let urlCityString: String = "https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}&units=metric"
    
    func getCurrentWeather(city: City) async -> WeatherReport {
        let cityURL = addCityToURL(city: city)
        let finalURL = cityURL.replacingOccurrences(of: "{API key}", with: self.apiKey)
        guard let url: URL = URL(string: finalURL)?.standardized else {
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
    
    private func addCityToURL(city: City) -> String {
        return self.urlCityString.replacingOccurrences(of: "{city name}", with: city.name.addingPercentEncoding(withAllowedCharacters: .letters)!)
    }
}


