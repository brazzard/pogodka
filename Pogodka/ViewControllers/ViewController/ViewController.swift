//
//  ViewController.swift
//  Pogodka
//
//  Created by Illia Verba on 1/5/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Nice style - using incapsulation for vars & outlets
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet var city: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var temp: UILabel!
    
    let url = "http://api.openweathermap.org/data/2.5/weather?q=Vinnytsya,UA&appid=d110b655383be2152d16c8f162745124"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stringURL = URL(string: url)!
        
        // TODO: IV
        // Replace api request to separated func and call it in viewWillAppear (UI outlets can be nil in viewDidLoad)
        URLSession.shared.dataTask(with: stringURL) { location, response, error in
            
            guard error == nil else { return }
            
            do {
                
                let weatherData = NSData(contentsOf: stringURL)
                let weatherJson = try JSONSerialization.jsonObject(with: weatherData! as Data) as! NSDictionary
                
                let weather = OpenWeatherMap(weatherJson: weatherJson)
                
                DispatchQueue.main.async {
                    self.iconImageView.image = weather.icon!
                    self.city.text = weather.nameCity
                    self.desc.text = weather.description
                    self.temp.text = String(weather.temp)
                }
                
            }   catch let error as NSError {
                print(error)
            }
            }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

