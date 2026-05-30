//
//  Weather.swift
//  SkyPeek
//
//  Created by CCS038 on 22/05/26.
//

struct Weather {
//    var city: String
    var temperature: Double
    var condition: WeatherCondition
    var windSpeed: Double
    var humidity: Int
}

extension Weather {
    var temperatureText: String {
        "\(temperature)ºC"
    }
    var windSpeedText: String {
        "\(windSpeed)km/h"
    }
    var humidityText: String {
        "\(humidity)%"
    }
}


// temperature: Double   →   temperatureText: String
