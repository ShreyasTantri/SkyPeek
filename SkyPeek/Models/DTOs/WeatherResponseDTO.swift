//
//  WeatherResponseDTO.swift
//  SkyPeek
//
//  Created by CCS038 on 23/05/26.
//

struct WeatherResponseDTO: Codable {
    let latitude: Double
    let longitude: Double
    let current: CurrentDTO
}

struct CurrentDTO: Codable {
    let time: String
    let interval: Int
    let temperature2M: Double
    let relativeHumidity2M: Int
    let windSpeed10M: Double
    let weatherCode: Int
    
    
    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature2M = "temperature_2m"
        case relativeHumidity2M = "relative_humidity_2m"
        case windSpeed10M = "wind_speed_10m"
        case weatherCode = "weather_code"
    }
}

extension CurrentDTO {
    func toDomain() -> Weather {
        return Weather(
            temperature: temperature2M,
            condition: WeatherCondition(weatherCode: weatherCode),
            windSpeed: windSpeed10M,
            humidity: relativeHumidity2M
        )
    }
}
