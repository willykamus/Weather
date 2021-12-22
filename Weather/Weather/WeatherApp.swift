//
//  WeatherApp.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(LocationViewModel())
        }
    }
}
