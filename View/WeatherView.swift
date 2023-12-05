//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import SwiftUI

struct WeatherView: View {
    @State private var location: String = ""
    @State private var weatherData: WeatherData?
    @EnvironmentObject var settings: SettingsViewController
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Location", text: $location)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )

                
                Button {
                    self.weatherData = nil
                    WeatherData.fetchWeather(for: location) { data in
                        self.weatherData = data
                    }
                } label: {
                    Text("Get Weather")
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                
                if let weatherData = weatherData {
                    WeatherDataView(weatherData: weatherData)
                }
            }
            .padding()
            .navigationBarTitle("Weather")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }) {
                Image(systemName: "gear")
            })
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
        }
    }
}
