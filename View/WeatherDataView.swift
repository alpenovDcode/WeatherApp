//
//  WeatherDataView.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import SwiftUI

struct WeatherDataView: View {
    @State var weatherData: WeatherData
    @EnvironmentObject var settings: SettingsViewController
    
    var body: some View {
        VStack {
            Text("Temperature: \(convertedTemperature(weatherData).temperature)\(convertedTemperature(weatherData).unit)")
            Text("Humidity: \(weatherData.humidity)%")
            Text("Description: \(weatherData.description)")
            Text("Date: \(formatDate(weatherData.date))")
        }
        .padding()
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(10)
    }
    
    func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    func convertedTemperature(_ data: WeatherData) -> (temperature: Double, unit: String) {
        let temperature = data.temperature
        if settings.selectedUnit == .celsius {
            return (temperature, "°C")
        } else {
            let fahrenheitTemperature = CelsiusToFahrenheit.convert(temperature, to: .fahrenheit)
            return (fahrenheitTemperature, "°F")
        }
    }


}
