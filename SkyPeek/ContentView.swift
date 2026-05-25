//
//  ContentView.swift
//  SkyPeek
//
//  Created by CCS038 on 22/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome to My Weather App!")
        }
        .padding()
        .onAppear {
            let fileLoader = LocalFileLoader()
            do {
                let data = try fileLoader.loadJSON()
                let dto = try JSONDecoder().decode(WeatherResponseDTO.self, from: data)
                let weather = dto.current.toDomain()
                print(weather.temperature)
                print(weather.humidity)
                print(weather.condition)
            } catch {
                print(error)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
