//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Альпеша on 04.12.2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject var settings = SettingsViewController()

        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(settings)
            }
        }

}
