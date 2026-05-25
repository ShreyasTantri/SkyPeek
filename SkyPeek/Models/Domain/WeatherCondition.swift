//
//  WeatherCondition.swift
//  SkyPeek
//
//  Created by CCS038 on 23/05/26.
//

enum WeatherCondition {
    case sunny
    case cloudy
    case rainy
    case stormy
    case snowy
    case unknown
    
    init(weatherCode: Int) {
        switch weatherCode {
        case 0:
            self = .sunny
        case 1, 2, 3:
            self = .cloudy
        case 51, 53, 55, 56, 57, 61, 63, 65, 80, 81, 82:
            self = .rainy
        case 71, 73, 75, 77, 85, 86:
            self = .snowy
        case 95, 96, 99:
            self = .stormy
        default:
            self = .unknown
        }
    }
}
