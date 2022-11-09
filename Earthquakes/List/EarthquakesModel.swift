//
//  ListModel.swift
//  Earthquakes
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

struct EarthquakesModel: Decodable {
    let earthquakes: [EarthquakeModel]
}


struct EarthquakeModel: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "eqid"
        case src
        case magnitude
    
    }
    
    let id: String
    let src: String
    let magnitude: Double
    
}
