//
//  EarthquakesService.swift
//  Earthquakes
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

protocol EarthquakesService {
    
    func load() async throws -> [EarthquakeModel]
        
    
}
