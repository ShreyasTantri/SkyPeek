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
    let repository = WeatherRepository()
    
    func loadWeather() async {
        state = .loading
        do {
            let weather = try await repository.fetchWeather()
            state = .loaded(weather)
        } catch {
            state = .failure(error)
        }
    }
}
