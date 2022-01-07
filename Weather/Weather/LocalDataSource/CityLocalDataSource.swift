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
    func save(city: City)
    func load()
}

class CoreDataLocalDataSource: CityLocalDataSource {
    
    private let key: String = "CitiesLoaded"
    
    func save(city: City) {
        let fetchRequest: NSFetchRequest<LSavedCities> = LSavedCities.fetchRequest()// An NSFetchRequest
        let viewContext = PersistenceController.shared.container.viewContext
        do {
            if let savedCities = try viewContext.fetch(fetchRequest).first {
                let city = self.get(uuid: city.id)
                savedCities.addToCities(city)
                PersistenceController.shared.save()
            }
        } catch {
            fatalError()
        }
    }
    
    func load() {
        if !UserDefaults.standard.bool(forKey: self.key) {
            let viewContext = PersistenceController.shared.container.viewContext
            do {
                if let path = Bundle.main.path(forResource: "cities", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let citiesLocal = try JSONDecoder().decode([CityLocalModel].self, from: data)
                    let countryDataSource: CountryLocalDataSource = CoreDataCountryLocalDataSource()
                    for city in citiesLocal {
                        let newCity = NSEntityDescription.insertNewObject (forEntityName: "LCity", into: viewContext) as NSManagedObject
                        newCity.setValue(city.name, forKey: "name")
                        let country = countryDataSource.get(code: city.country)
                        newCity.setValue(country.name, forKey: "country")
                        newCity.setValue(UUID(), forKey: "id")
                    }
                    PersistenceController.shared.save()
                    UserDefaults.standard.set(true, forKey: self.key)
                    UserDefaults.standard.synchronize()
                }
                
                NSEntityDescription.insertNewObject (forEntityName: "LSavedCities", into: viewContext) as NSManagedObject
                PersistenceController.shared.save()
                
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
                foundCities.append(City(id: city.id!, name: city.name!, country: city.country!))
            }
            return foundCities
        } catch {
            return []
        }
    }
    
    private func get(uuid: UUID) -> LCity {
        do {
            let fetchRequest: NSFetchRequest<LCity>
            fetchRequest = LCity.fetchRequest()
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == %@", uuid as NSUUID)
            let viewContext = PersistenceController.shared.container.viewContext
            let city: [LCity] = try viewContext.fetch(fetchRequest)
            return city.first!
        } catch {
            fatalError()
        }
    }
}

