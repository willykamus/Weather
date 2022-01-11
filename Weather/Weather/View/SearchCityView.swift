//
//  SearchCityView.swift
//  Weather
//
//  Created by William Ching on 2022-01-02.
//

import SwiftUI

struct SearchCityView: View {
    
    @Binding var isPresented: Bool
    @State var searchText: String = ""
    @ObservedObject var viewModel: SearchCityViewModel = SearchCityViewModel()
    @EnvironmentObject var locationListViewModel: LocationListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.foundedCities) { city in
                    Button {
                        self.viewModel.save(city: city)
                        Task {
                            await self.locationListViewModel.getWeatherReportForSelectedCity(city: city)
                        }
                        self.isPresented.toggle()
                    } label: {
                        Text("\(city.name), \(city.country)")
                    }
                }
            }
            .id(UUID())
        }
        .searchable(text: self.$searchText, prompt: "Search for a city")
        .onChange(of: self.searchText) { newValue in
            self.viewModel.search(text: newValue)
        }
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCityView(isPresented: .constant(true))
    }
}
