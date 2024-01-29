//
//  ViewController.swift
//  WeatherDataFetching(Weather_Api)
//
//  Created by Mac on 29/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var updateTimeLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var contryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchdata()
        
    }
    
    func fetchdata()
    {
        
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=65a7aea3e395474187a20653220504&q=india&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data , error == nil else
            {
                print("Error Occured While Accessing Data with URL")
                return
            }
            var fullWeatherData: WeatherData?
            do
            {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }
            catch
            {
                print("Error Occured While Decodeing JSON into Swift Structure \(error)")
            }
            DispatchQueue.main.async {
                self.updateTimeLabel.text = "Updated : \(fullWeatherData!.current.last_updated)"
                self.regionLabel.text = "Region : \(fullWeatherData!.location.region)"
                self.contryLabel.text = "Contry : \(fullWeatherData!.location.country)"
                self.temperatureLabel.text = "Temperature (Celsius) : \(fullWeatherData!.current.temp_c)"
                self.humidityLabel.text = "Humidity : \(fullWeatherData!.current.humidity)"
                self.windLabel.text = "Wind(km/hrs) : \(fullWeatherData!.current.wind_kph)"
            }
        })
        dataTask.resume()
    }
    @IBAction func refreshData(_ sender: Any) {
        fetchdata()
    }
}

