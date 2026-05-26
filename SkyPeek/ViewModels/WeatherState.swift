//
//  WeatherState.swift
//  SkyPeek
//
//  Created by CCS038 on 26/05/26.
//

enum WeatherState {
    case idle
    case loading
    case loaded(Weather)
    case failure(Error)
}
