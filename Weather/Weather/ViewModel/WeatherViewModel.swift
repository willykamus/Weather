//
//  WeatherViewModel.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    @Published var currentCityWeather: Weather?
    
    private var getCurrentWeatherInteractor: GetCurrentWeatherInteractor = GetCurrentWeatherInteractorImpl()
    
    func getCurrentCityWeather(location: Location) async {
        let weather: Weather = await getCurrentWeatherInteractor.execute(location: location)
        Task {
            self.currentCityWeather = weather
        }
    }
    
}
