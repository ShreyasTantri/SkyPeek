//
//  Weather.swift
//  SkyPeek
//
//  Created by CCS038 on 22/05/26.
//

// 1. Define domain model

enum WeatherCondition {
    case sunny
    case cloudy
    case rainy
    case stormy
    case snowy
    case misty
    case unknown
}

struct Weather {
    var city: String
    var temperature: Double
    var condition: WeatherCondition   // use enum
    var windSpeed: Double
}


// 2. Define DTO
