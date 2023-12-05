//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import SwiftUI


enum TemperatureUnit: String, CaseIterable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
}

class SettingsViewController: ObservableObject {
    @Published var selectedUnit: TemperatureUnit = .celsius
}
