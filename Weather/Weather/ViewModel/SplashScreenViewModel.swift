//
//  SplashScreenViewModel.swift
//  Weather
//
//  Created by William Ching on 2022-01-07.
//

import Foundation

class SplashScreenViewModel: ObservableObject {
    
    func load() {
        CoreDataCountryLocalDataSource().load()
        CoreDataLocalDataSource().load()
    }
}
