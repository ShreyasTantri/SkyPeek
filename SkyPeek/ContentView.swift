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
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            let fileLoader = LocalFileLoader()
            do {
                let data = try fileLoader.loadJSON()
                let dto = try JSONDecoder().decode(WeatherResponseDTO.self, from: data)
                // Temporary decoding verification
                print(dto.current.temperature2M)
                print(dto.current.relativeHumidity2M)
                print(dto.current.weatherCode)
            } catch {
                print(error)
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
