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
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weatherReport.cityName()).bold().font(.title)
                    Text(weatherReport.currentWeatherDescriptionString().capitalized).font(.body)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text(weatherReport.currentTemperature()).bold().font(.title)
                    VStack(alignment: .center) {
                        Text("Feels like").font(.footnote)
                        Text(weatherReport.currentFeelsLikeTemperature()).font(.footnote)
                    }
                }

            }
            
            HStack {
                VStack {
                    Text(weatherReport.firstHourFromNow())
                    Text(weatherReport.firstTemperatureFromNow())
                }
                Spacer()
                VStack {
                    Text(weatherReport.secondHourFromNow())
                    Text(weatherReport.secondTemperatureFromNow())
                }
                Spacer()
                VStack {
                    Text(weatherReport.thirdHourFromNow())
                    Text(weatherReport.thirdTemperatureFromNow())
                }
                Spacer()
                VStack {
                    Text(weatherReport.forthHourFromNow())
                    Text(weatherReport.forthTemperatureFromNow())
                }
                Spacer()
                VStack {
                    Text(weatherReport.fifthHourFromNow())
                    Text(weatherReport.fifthTemperatureFromNow())
                }
            }.frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct LocationWeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationWeatherCardView(weatherReport: PreviewWeatherReport().getWeatherReport())
    }
}
