//
//  LocationListView.swift
//  Weather
//
//  Created by William Ching on 2022-01-07.
//

import SwiftUI

struct LocationListView: View {
    
    @StateObject var viewModel = LocationListViewModel()
    @State var searchCity: Bool = false
    
    var body: some View {
        List {
            ForEach(viewModel.weatherReports, id: \.self) { report in
                LocationWeatherCardView(weatherReport: report)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        
        .id(UUID())
        .task {
            await viewModel.getCurrentWeatherForSavedCities()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Add") {
                    searchCity.toggle()
                }
            }
        }
        .sheet(isPresented: self.$searchCity, onDismiss: {

        }, content: {
            SearchCityView(isPresented: self.$searchCity).environmentObject(self.viewModel)
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
