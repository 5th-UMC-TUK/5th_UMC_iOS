//
//  Weather.swift
//  week5_mission
//
//  Created by Subeen on 2023/10/31.
//

import Foundation

struct WeatherResponse: Decodable {
    let weather: [Weather]
    let main: Main
    let name: String
}

struct Main: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

//// MARK: - Welcome
//struct WeatherResponse: Codable {
//    let weather: [Weather]
//    let main: Main?
//    let visibility: Int
//    let dt: Int
//    let timezone, id: Int
//    let name: String
//    let cod: Int
//}
//
//
//
//// MARK: - Main
//struct Main: Codable {
//    let temp, feelsLike, tempMin, tempMax: Double?
//    let pressure, humidity, seaLevel, grndLevel: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure, humidity
//        case seaLevel = "sea_level"
//        case grndLevel = "grnd_level"
//    }
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    let id: Int?
//    let main, description, icon: String?
//}
