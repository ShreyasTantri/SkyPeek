//
//  WeatherService.swift
//  SkyPeek
//
//  Created by CCS038 on 28/05/26.
//

import Foundation

struct WeatherService {
    func fetchWeatherData(latitude: Double, longitude: Double) async throws -> Data {
        let urlString =
        "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,relative_humidity_2m,wind_speed_10m,weather_code"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
}
