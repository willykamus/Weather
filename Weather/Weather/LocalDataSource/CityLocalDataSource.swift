//
//  CityLocalDataSource.swift
//  Weather
//
//  Created by William Ching on 2022-01-02.
//

import Foundation

protocol CityLocalDataSource {
    func get(string: String) -> [City]
}

class CoreDataLocalDataSource: CityLocalDataSource {
    
    func get(string: String) -> [City] {
        do {
            if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let cities = try JSONSerialization.jsonObject(with: data, options: [])
                print(cities)
//                let remoteEntity = try JSONDecoder().decode(FullWeatherRemoteResponse.self, from: data)
//                return WeatherRemoteMapper().toWeather(remoteEntity: remoteEntity)
            }
            
        } catch {
            
        }
        
        return []
    }
    
    
}

