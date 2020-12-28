//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mohammad Edrees on 12/12/20.


import UIKit
import Kingfisher

class WeatherViewController: UIViewController {
    

    @IBOutlet weak var searchBar: UISearchBar! {
        
        didSet {
            searchBar.placeholder = "Enter city name..."
        }
    }

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var degreelabel: UILabel!
    @IBOutlet weak var observeTimeLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var WeatherPressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    var viewModel = WeatherViewModel()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            self.searchBar.delegate = self
            self.viewModel.delegate = self
             welcomeScreen()
            
         
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let DetailedViewController = segue.destination as! DetailedViewController
        DetailedViewController.countrynew = countryLabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.citynew = cityNameLabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.weatherdesc = conditionLabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.temperature = degreelabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.humidity = humidityLabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.windir = windLabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.obserTime = observeTimeLabel.text
        
        _ = segue.destination as! DetailedViewController
        DetailedViewController.pressure = WeatherPressureLabel.text
        
       
    }
    

    
    @IBAction func ClickLabel(_ sender: Any) {
        performSegue(withIdentifier: "DetailSeque", sender: self)

    }
    
    //Welcome Screen Note
    func welcomeScreen() {
        
        cityNameLabel.text = "Welcome to Weather App"
        imgLabel.isHidden = true
        conditionLabel.text = "Search weather based on the city name...!"
        observeTimeLabel.isHidden = true
        degreelabel.isHidden = true
        countryLabel.isHidden = true
        WeatherPressureLabel.isHidden = true
        humidityLabel.isHidden = true
        windLabel.isHidden = true
        
    
        
        
    }
    
    // Print the Label and Welcome Screen Message
    func weatheritems() {
        imgLabel.isHidden = false
        observeTimeLabel.isHidden = false
        degreelabel.isHidden = false
        
        
        
        conditionLabel.text = viewModel.weather_descriptions
        cityNameLabel.text = viewModel.name
        degreelabel.text =  "\(viewModel.temperature)"+"֯"
        observeTimeLabel.text = viewModel.observation_time
        countryLabel.text = viewModel.country
        humidityLabel.text = "Hum: \(viewModel.humidity)"
        windLabel.text = "W-d: \(viewModel.wind_dir)"
        WeatherPressureLabel.text = "Pr: \(viewModel.pressure)"
        
        
        
        // set image with KingFisher downloading from server side
        let url = URL(string: viewModel.weather_icons)
        imgLabel.kf.setImage(with: url)
    }
}
extension WeatherViewController: UISearchBarDelegate, WeatherViewModelDelegate {
    func updatecity() {
        DispatchQueue.main.async {
            self.weatheritems()
        }
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        
        viewModel.searchcity(text: text)
        searchBar.text = ""
        
}
    

}
