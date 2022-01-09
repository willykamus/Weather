//
//  GetCoordinatesInteractor.swift
//  Weather
//
//  Created by William Ching on 2022-01-09.
//

import Foundation
import CoreLocation

protocol GetCoordinatesInteractor {
    func execute(city: City) async -> CLLocation
}

class GetCoordinatesInteractorImpl: GetCoordinatesInteractor {
    
    let cityRemoteDataSource: CityRemoteDataSource = CityRemoteDataSourceImpl()
    func execute(city: City) async -> CLLocation {
        return await self.cityRemoteDataSource.getCoordinates(city: city)
    }
}
