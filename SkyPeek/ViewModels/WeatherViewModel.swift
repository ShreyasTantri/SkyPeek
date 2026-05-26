//
//  WeatherViewModel.swift
//  SkyPeek
//
//  Created by CCS038 on 26/05/26.
//
import Foundation

@Observable
final class WeatherViewModel {
    var state: WeatherState = .idle
    let fileLoader = LocalFileLoader()
    
    func loadWeather() {
        /*
         state = .loading
         ↓
         try loading pipeline
         ↓
         success → .loaded(weather)
         ↓
         failure → .failure(error)
         */
        state = .loading
        do {
            let data = try fileLoader.loadJSON()
            let dto = try JSONDecoder().decode(WeatherResponseDTO.self, from: data)
            let weather = dto.current.toDomain()
            state = .loaded(weather)
        } catch {
            state = .failure(error)
        }
    }
}

/*
 .loading
 ↓
 load data
 ↓
 decode
 ↓
 map
 ↓
 .loaded(weather)
 */
