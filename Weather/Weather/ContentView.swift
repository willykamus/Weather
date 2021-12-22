//
//  ContentView.swift
//  Weather
//
//  Created by William Ching on 2021-12-22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        Text("\(String(locationViewModel.location?.latitude ?? 0.0)) + \(String(locationViewModel.location?.longitude ?? 0.0))")
            .padding()
            .onAppear {
                self.locationViewModel.requestLocation()
                self.locationViewModel.getCurrentLocation()
            }
        Text(locationViewModel.currentCity?.name ?? "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
