//
//  APIEarthquakesService.swift
//  Earthquakes
//
//  Created by Yuliya Ratkevcih on 08.11.22.
//

import Foundation

final class APIEarthquakesService: EarthquakesService {
    enum APIError: Error {
        case invalidURL
        case invalidResponse
        
    }
    
    func load() async throws -> [EarthquakeModel] {
        
        guard let url = URL(string: "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        let model = try decoder.decode(EarthquakesModel.self, from: data)
        
        
        return model.earthquakes
        
        
    }
    
    
}
