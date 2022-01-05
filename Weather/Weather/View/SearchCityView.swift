//
//  SearchCityView.swift
//  Weather
//
//  Created by William Ching on 2022-01-02.
//

import SwiftUI

struct SearchCityView: View {
    
    @State var searchText: String = ""
    @ObservedObject var viewModel: SearchCityViewModel = SearchCityViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.foundedCities) { city in
                    Text("\(city.name), \(city.country)")
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
        SearchCityView()
    }
}
