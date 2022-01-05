//
//  WeatherApp.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    var locationViewModel = LocationViewModel()
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
