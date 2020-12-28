//
//  Model.swift
//  WeatherApp
//
//  Created by Mohammad Edrees on 12/12/20.
//

import Foundation

struct weather: Codable {
    var current: current?
    var location: location?
}
struct current: Codable {
    var weather_icons: [String]?
    var weather_descriptions: [String]?
    var temperature: Int?
    var observation_time: String?
    var wind_dir: String?
    var humidity: Int?
    var pressure: Int?
}

struct location: Codable {
    var name: String?
    var country: String?
    var timezone_id: String?
    
    
}
