//
//  WeatherApiRequest.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import SwiftUI
import Foundation

class WeatherApiRequest {
    static let shared = WeatherApiRequest()
    
    private let apiKey = "9470b96d4753b4ec551c50d26408171f"
    
    func fetchWeatherData(for location: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let apiResponse = try decoder.decode(WeatherAPIResponse.self, from: data)
                    
                    let weatherData = WeatherData(temperature: apiResponse.main.temp, humidity: apiResponse.main.humidity, description: apiResponse.weather.first?.description ?? "N/A", date: Date())
                    completion(.success(weatherData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
