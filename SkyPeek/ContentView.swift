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
                VStack(spacing: 12) {
                    Text(weather.city)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                    
                    Text(weather.temperatureText)
                        .font(.largeTitle)
//                        .font(.system(size: 44, weight: .semibold, design: .rounded))
                        
                    Text(weather.condition.displayName)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    HStack {
                        Text("Humidity: \(weather.humidityText)")
                            .font(.footnote)
                        
                        Spacer()
                        
                        Text("Wind speed: \(weather.windSpeedText)")
                            .font(.footnote)
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            case .failure(let error):
                Text("Something went wrong! \(error.localizedDescription)")
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
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

#Preview {
    ContentView()
}
