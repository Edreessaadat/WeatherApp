//
//  WeatherAPIRequest.swift
//  WeatherApp
//
//  Created by Mohammad Edrees on 12/12/20.
//

import Foundation


class WeatherService {
    
    typealias success = (weather) -> ()
    static func getWeather(cityName: String, onSucess: @escaping success) {
        
        let API_KEY = "45bbdedbfe9401d6be87e12dfece6c0d"
        if let url = URL(string: "http://api.weatherstack.com/current?access_key=\(API_KEY)&query=\(cityName)") {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
            
                   
                do {
                    let json = try JSONDecoder().decode(weather.self, from: data)
                    onSucess(json)
                    //print(json)
                }catch {
                    print("This is wrong try")
                }
        
        
            }.resume()
            
        }
        
    }
    
}

