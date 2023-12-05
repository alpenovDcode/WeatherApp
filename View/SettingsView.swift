//
//  SettingsView.swift
//  WeatherApp
//
//  Created by Альпеша on 05.12.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsViewController
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Temperature Unit")) {
                    Picker("Unit", selection: $settings.selectedUnit) {
                        ForEach(TemperatureUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarItems(trailing:
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
            )
            .navigationBarTitle("Settings")
        }
    }
}

