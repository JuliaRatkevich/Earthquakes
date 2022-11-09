//
//  EarthquakesListView.swift
//  Earthquakes
//
//  Created by Yuliya Ratkevcih on 09.11.22.
//

import SwiftUI

struct EarthquakesListView: View {
    @ObservedObject private var viewModel = EarthquakesViewModel(service: APIEarthquakesService())
    
    
    
    var body: some View {
        switch viewModel.state {
        case .loading:
            loadingView
        case .failure:
            failureView
        case .loaded(let earthquakes):
            NavigationView {
                List(earthquakes) { earthquak in
                    NavigationLink {
                        VStack {
                            Text(earthquak.src)
                            Text("\(earthquak.magnitude)")
                        }
                    } label: {
                        EarthquakesRowView(earthquake: earthquak)
                    }
                }
                .listStyle(.plain)
                
                .navigationTitle("Earthquakes")
            }
        }
    }

    
   private var loadingView: some View {
        ProgressView()
    }
    
    
   private var failureView: some View {
        VStack {
            Text("❌")
            Text("OOops!")
        }
    }
    
}

struct EarthquakesListView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakesListView()
    }
}
