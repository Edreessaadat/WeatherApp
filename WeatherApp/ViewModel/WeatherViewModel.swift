//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mohammad Edrees on 12/14/20.
//

import Foundation


protocol WeatherViewModelDelegate: class {
    func updatecity()
}

class WeatherViewModel {

       var weatherinfo: weather?
       weak var delegate: WeatherViewModelDelegate?
    
    
    
    func searchcity(text: String) {
        
        WeatherService.getWeather(cityName: text)  { [weak self] city in
            self?.weatherinfo = city
            self?.delegate?.updatecity()
        }
    }
        
        
    var name: String {
        
        if let name = self.weatherinfo?.location?.name {
            return String(name)
        }
        else {
            return ""
        }
    }
    
    var observation_time: String {
        
        if let observation_time = self.weatherinfo?.current?.observation_time {
            return String(observation_time)
        }
        else {
            return ""
        }
    }
    
    var temperature: String {

        if let temperature = self.weatherinfo?.current?.temperature {
            return String(temperature)
        }
        else {
            return ""
        }
    }
        
        
        
    var weather_descriptions: String {

        if let weather_descriptions = self.weatherinfo?.current?.weather_descriptions?.first {
            return String(weather_descriptions)
        }
        else {
            return ""
        }
    }
    
    var weather_icons: String {
        if let weather_icons = self.weatherinfo?.current?.weather_icons?.first {
            return String(weather_icons)
        }
        else {
            return ""
        }

    }
    
    var wind_dir: String {
        
        if let wind_dir = self.weatherinfo?.current?.wind_dir {
            
            return String(wind_dir)
        }
        else {
            return ""
        }
    }
    
    var humidity: String {
        
        if let humidity = self.weatherinfo?.current?.humidity {
            
            return String(humidity)
        }
        else {
            return ""
        }
    }
    
    var country: String {
        
        if let country = self.weatherinfo?.location?.country {
            
            return String(country)
        }
        else {
            return ""
        }
    }
    
    var timezone_id: String {
        
        if let timezone_id = self.weatherinfo?.location?.timezone_id {
            
            return String(timezone_id)
        }
        else {
            return ""
        }
    }
    
    var pressure: String {
        
        if let pressure = self.weatherinfo?.current?.pressure {
            
            return String(pressure)
        }
        else {
            return ""
        }
    }
    
    
    
}
