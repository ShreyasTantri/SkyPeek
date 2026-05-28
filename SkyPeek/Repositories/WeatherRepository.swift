//
//  WeatherRepository.swift
//  SkyPeek
//
//  Created by CCS038 on 27/05/26.
//

import Foundation

final class WeatherRepository {
    let service = WeatherService()
    
    func fetchWeather() async throws -> Weather {
        let data = try await service.fetchWeatherData(latitude: 12.9719, longitude: 77.5937)
        let dto = try JSONDecoder().decode(WeatherResponseDTO.self, from: data)
        let weather = dto.current.toDomain()
        return weather
    }
}
