//
//  EarthquakesRowView.swift
//  Earthquakes
//
//  Created by Yuliya Ratkevcih on 09.11.22.
//

import SwiftUI

struct EarthquakesRowView: View {
    let earthquake: EarthquakeModel
    
    
    var body: some View {
        HStack {
            Text(earthquake.src)
            Spacer()
            Text("\(earthquake.magnitude)")
        }
        
    }
}

struct EarthquakesRowView_Previews: PreviewProvider {
    static var previews: some View {
        EarthquakesRowView(earthquake: EarthquakeModel(id: "123", src: "USA", magnitude: 8.8))
    }
}
