//
//  CountryLocalDataSource.swift
//  Weather
//
//  Created by William Ching on 2022-01-03.
//

import Foundation
import CoreData

protocol CountryLocalDataSource {
    func get(code: String) -> Country
    func load()
}

class CoreDataCountryLocalDataSource: CountryLocalDataSource {
    
    private let key: String = "CountryLoaded"
    
    static var countries: [Country] = []
    
    func load() {
        if !UserDefaults.standard.bool(forKey: self.key) {
            do {
                if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    CoreDataCountryLocalDataSource.countries = try JSONDecoder().decode([Country].self, from: data)
//                    let viewContext = PersistenceController.shared.container.viewContext
//                    for country in countriesLocal {
//                        let newCity = NSEntityDescription.insertNewObject (forEntityName: "LCountry", into: viewContext) as NSManagedObject
//                        newCity.setValue(country.name, forKey: "name")
//                        newCity.setValue(country.code, forKey: "code")
//                    }
//                    PersistenceController.shared.save()
                    UserDefaults.standard.set(true, forKey: self.key)
                    UserDefaults.standard.synchronize()
                }
                
            } catch {
                
            }
        }
    }
    
    func get(code: String) -> Country {
        return CoreDataCountryLocalDataSource.countries.filter { $0.code == code } .first!
//        do {
//            let fetchRequest: NSFetchRequest<LCountry>
//            fetchRequest = LCountry.fetchRequest()
//            fetchRequest.predicate = NSPredicate(format: "code == %@", code)
//
//            // Get a reference to a NSManagedObjectContext
//            let context = PersistenceController.shared.container.viewContext
//
//            // Fetch all objects of one Entity type
//            let objects = try context.fetch(fetchRequest)
//            return Country(name: objects.first!.name!, code: objects.first!.code!)
//
//        } catch {
//            return Country(name: "", code: "")
//        }
    }
    
    
}
