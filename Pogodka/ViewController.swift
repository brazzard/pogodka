//
//  ViewController.swift
//  Pogodka
//
//  Created by Illia Verba on 1/5/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var city: UITextView!
    @IBOutlet var desc: UITextView!
    @IBOutlet var temp: UITextView!
    
    
    let url = "http://api.openweathermap.org/data/2.5/weather?q=Vinnytsya,UA&appid=d110b655383be2152d16c8f162745124"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let stringURL = URL(string: url)!
        let weatherObject = NSData(contentsOf: stringURL)
        //print(weatherObject)
        
        let session = URLSession.shared
        let task = session.downloadTask(with: stringURL) { (location: URL?, response: URLResponse?, error: Error?) -> Void
            in
            
            if error != nil {
                print(error)
            } else {
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
                    
                    
                    
                    } catch let error as NSError {
                        print(error)
                    }
            }
        
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

