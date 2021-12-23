//
//  ContentView.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        Text("\(String(locationViewModel.location?.latitude ?? 0.0)) + \(String(locationViewModel.location?.longitude ?? 0.0))")
            .padding()
            .onAppear {
                self.locationViewModel.requestLocation()
                self.locationViewModel.getCurrentLocation()
                Task {
                    if let location = self.locationViewModel.location {
                        await self.weatherViewModel.getCurrentCityWeather(location: location)
                    }
                }
            }
        
        Text(locationViewModel.currentCity?.name ?? "")
        Text(weatherViewModel.currentCityWeather?.description ?? "")
        Text(weatherViewModel.currentCityWeather?.main ?? "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
