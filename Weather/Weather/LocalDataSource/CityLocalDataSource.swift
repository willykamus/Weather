//
//  CityLocalDataSource.swift
//  Weather
//
//  Created by William Ching on 2022-01-02.
//

import Foundation
import CoreData

protocol CityLocalDataSource {
    func get(string: String) -> [City]
    func load()
}

class CoreDataLocalDataSource: CityLocalDataSource {
    private let key: String = "CitiesLoaded"
    
    func load() {
        if !UserDefaults.standard.bool(forKey: self.key) {
            do {
                if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let citiesLocal = try JSONDecoder().decode([CityLocalModel].self, from: data)
                    let viewContext = PersistenceController.shared.container.viewContext
                    let countryDataSource: CountryLocalDataSource = CoreDataCountryLocalDataSource()
                    for city in citiesLocal {
                        let newCity = NSEntityDescription.insertNewObject (forEntityName: "LCity", into: viewContext) as NSManagedObject
                        newCity.setValue(city.name, forKey: "name")
                        let country = countryDataSource.get(code: city.country)
                        newCity.setValue(country.name, forKey: "country")
                    }
                    PersistenceController.shared.save()
                    UserDefaults.standard.set(true, forKey: self.key)
                    UserDefaults.standard.synchronize()
                }
                
            } catch {
                
            }
        }
    }
    
    func get(string: String) -> [City] {
        do {
            let fetchRequest: NSFetchRequest<LCity>
            fetchRequest = LCity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS[cd] %@", string)
            let sortDescriptor = NSSortDescriptor(key: "name", ascending: true )
            fetchRequest.sortDescriptors = [ sortDescriptor ]
            
            // Get a reference to a NSManagedObjectContext
            let context = PersistenceController.shared.container.viewContext
            
            // Fetch all objects of one Entity type
            let objects = try context.fetch(fetchRequest)
            var foundCities: [City] = []
            for city in objects {
                foundCities.append(City(name: city.name!, country: city.country!))
            }
        
            return foundCities
            
        } catch {
            return []
        }
    }
}

