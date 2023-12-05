//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import Foundation

struct WeatherData: Codable {
    var temperature: Double
    var humidity: Double
    var description: String
    var date: Date // Добавляем дату времени получения информации о погоде
    
    init(temperature: Double, humidity: Double, description: String, date: Date) {
        self.temperature = temperature
        self.humidity = humidity
        self.description = description
        self.date = date
    }
    
    
    // Пример функции для получения данных о погоде для указанной локации
    static func fetchWeather(for location: String, completion: @escaping (WeatherData?) -> Void) {
        WeatherApiRequest.shared.fetchWeatherData(for: location) { result in
            switch result {
            case .success(let data):
                let weatherData = WeatherData(temperature: data.temperature, humidity: data.humidity, description: data.description, date: Date())
                completion(weatherData)
            case .failure(_):
                completion(nil)
            }
        }
    }
    
}

struct CelsiusToFahrenheit {
    static func convert(_ temperature: Double, to unit: TemperatureUnit) -> Double {
        switch unit {
            case .celsius:
                return temperature
            case .fahrenheit:
                return temperature * 9 / 5 + 32
        }
    }
}

