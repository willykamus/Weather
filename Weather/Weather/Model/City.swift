//
//  City.swift
//  Weather
//
//  Created by William Ching on 2021-12-21.
//

import Foundation

struct City: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var country: String
}
