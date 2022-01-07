//
//  SearchCityViewModel.swift
//  Weather
//
//  Created by William Ching on 2022-01-02.
//

import Foundation

class SearchCityViewModel: ObservableObject {
    
    @Published var foundedCities: [City] = []
    private var searchText: String = ""
    private let getSearchCitiesInteractor: GetSearchCitiesInteractor = GetSearchCitiesInteractorImpl()
    private let saveSelectedCityInteractor: SaveSelectedCityInteractor = SaveSelectedCityInteractorImpl()
    
    func search(text: String) {
        
        if text.count < self.searchText.count {
            let cities = getSearchCitiesInteractor.execute(text: text)
            DispatchQueue.main.async {
                self.foundedCities = cities
            }
        }
        
        if text.isEmpty {
            foundedCities.removeAll()
        }
        
        if foundedCities.count > 0 {
            foundedCities = foundedCities.filter { $0.name.contains(text) }
        } else {
            let cities = getSearchCitiesInteractor.execute(text: text)
            DispatchQueue.main.async {
                self.foundedCities = cities
            }
        }
        
        self.searchText = text
    }
    
    func save(city: City) {
        print("Trying to save")
        saveSelectedCityInteractor.execute(city: city)
    }
}
