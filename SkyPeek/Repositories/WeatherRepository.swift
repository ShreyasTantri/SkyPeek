//
//  WeatherRepository.swift
//  SkyPeek
//
//  Created by CCS038 on 27/05/26.
//

import Foundation

final class WeatherRepository {
    let fileLoader = LocalFileLoader()
    
    func fetchWeather() throws -> Weather {
        let data = try fileLoader.loadJSON()
        let dto = try JSONDecoder().decode(WeatherResponseDTO.self, from: data)
        let weather = dto.current.toDomain()
        return weather
    }
}
