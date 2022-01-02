//
//  ContentView.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        if let weather = weatherViewModel.currentCityWeather {
            LocationWeatherCardView(weatherReport: weather)
        } else {
            if locationViewModel.location == nil {
                ProgressView().progressViewStyle(.automatic).onAppear {
                    locationViewModel.requestLocation()
                    locationViewModel.getCurrentLocation()
                    CoreDataLocalDataSource().get(string: "")
                }
            } else {
                ProgressView().progressViewStyle(.automatic).task {
                    if let location = locationViewModel.location {
                        await weatherViewModel.getCurrentCityWeather(location: location)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
