//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Mohammad Edrees on 12/17/20.
//

import UIKit

class DetailedViewController: UIViewController {

    var countrynew: String?
    var citynew: String?
    var weatherdesc: String?
    var timezone: String?
    var temperature: String?
    var windir: String?
    var humidity: String?
    var pressure: String?
    var weatherIcon: UIImage?
    var obserTime: String?
    
    
   
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var TimezoneLabel: UILabel!
    @IBOutlet weak var PressureLabel: UILabel!
    @IBOutlet weak var ObservationLabel: UILabel!
    @IBOutlet weak var DetailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail of Report"
        view.backgroundColor = #colorLiteral(red: 0.5735439658, green: 0.7802882791, blue: 0.9120278955, alpha: 1)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        countryLabel.text = countrynew
        cityLabel.text = citynew
        conditionLabel.text = weatherdesc
        TemperatureLabel.text = temperature
        humidityLabel.text = humidity
        windLabel.text = windir
        ObservationLabel.text = obserTime
        TimezoneLabel.text = timezone
        PressureLabel.text = pressure
       
    }
    

}


