//
//  LocationWeatherCardView.swift
//  Weather
//
//  Created by William Ching on 2021-12-23.
//

import SwiftUI

struct LocationWeatherCardView: View {
    
    var weatherReport: WeatherReport
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(weatherReport.cityName()).bold().font(.title)
                Text(weatherReport.description.capitalized).font(.body)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                Text(weatherReport.currentTemperature()).bold().font(.title)
                VStack(alignment: .center) {
                    Text("Feels like").font(.footnote)
                    Text(weatherReport.feelsLike()).font(.footnote)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.orange)
        .cornerRadius(16)
    }
}

struct LocationWeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationWeatherCardView(weatherReport: PreviewWeatherReport().getWeatherReport())
    }
}
