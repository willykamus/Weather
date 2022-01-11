//
//  PreviewWeatherReport.swift
//  Weather
//
//  Created by William Ching on 2021-12-23.
//

import Foundation

class PreviewWeatherReport {
    func getWeatherReport() -> WeatherReport {
        do {
            if let path = Bundle.main.path(forResource: "jsonResponse", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let remoteEntity = try JSONDecoder().decode(OneCallResponse.self, from: data)
                return WeatherRemoteMapper().toWeather(oneCallResponse: remoteEntity, city: City(id: UUID(), name: "Caracas", country: "Venezuela"))
            }
            return WeatherReport.empty()
        } catch {
            return WeatherReport.empty()
        }
    }
}
