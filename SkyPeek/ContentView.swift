//
//  ContentView.swift
//  SkyPeek
//
//  Created by CCS038 on 22/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = WeatherViewModel()
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .loaded(let weather):
                VStack {
                    Text("\(weather.temperature)")
                    Text("\(weather.humidity)")
                    Text("\(weather.windSpeed)")
                    Text("\(weather.condition.displayName)")
                }
            case .failure(let error):
                Text("Something went wrong! \(error.localizedDescription)")
            }
        }
        .padding()
        .onAppear() {
            Task {
                await viewModel.loadWeather()
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
