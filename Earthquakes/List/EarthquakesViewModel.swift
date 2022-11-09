//
//  EarthquakesViewModel.swift
//  Earthquakes
//
//  Created by Yuliya Ratkevcih on 09.11.22.
//

import Foundation

final class EarthquakesViewModel: ObservableObject {
    enum State {
        case loading
        case failure
        case loaded([EarthquakeModel])
    }
    
    private let service: EarthquakesService
    @Published var state: State
    
    init(service: EarthquakesService) {
        self.service = service
        self.state = State.loading
        load()
    }
    
    func load() {
        Task {
            do {
                let earthquakes = try await service.load()
                DispatchQueue.main.async {
                    self.state = State.loaded(earthquakes)
                }
                
            } catch {
                DispatchQueue.main.async {
                    self.state = State.failure
                }
                
            }
            
        }
        
    }
}
