//
//  WeatherApiResponse.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import SwiftUI

struct WeatherAPIResponse: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Double
}

struct Weather: Codable {
    let description: String
}

enum NetworkError: Error {
    case invalidURL
}
