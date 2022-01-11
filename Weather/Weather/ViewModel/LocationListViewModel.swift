//
//  LocationListViewModel.swift
//  Weather
//
//  Created by William Ching on 2022-01-07.
//

import Foundation
@MainActor
class LocationListViewModel: ObservableObject {
    
    @Published var weatherReports: [WeatherReport] = []
    
    private let getSavedCitiesInteractor: GetSavedCitiesInteractor = GetSavedCitiesInteractorImpl()
    private let getCurrentWeatherForCityInteractor: GetCurrentWeatherForCityInteractor = GetCurrentWeatherForCityInteractorImpl()
    private let coordinates = GetCoordinatesInteractorImpl()
    
    func getCurrentWeatherForSavedCities() async {
        self.weatherReports.removeAll()
        let savedCities = getSavedCitiesInteractor.execute()
        var reports: [WeatherReport] = []
        for city in savedCities {
            let report = await self.getCurrentWeatherForCityInteractor.execute(city: city)
            reports.append(report)
        }
        self.weatherReports.append(contentsOf: reports)
    }
    
    func getWeatherReportForSelectedCity(city: City) async {
        let report = await self.getCurrentWeatherForCityInteractor.execute(city: city)
        self.weatherReports.append(report)
    }
}
