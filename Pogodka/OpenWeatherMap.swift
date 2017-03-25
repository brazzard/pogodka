//
//  OpenWeatherMap.swift
//  Pogodka
//
//  Created by Illia Verba on 3/25/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import Foundation
import UIKit

class OpenWeatherMap {
    
    var nameCity: String
    var temp: String
    var description: String
    var icon: UIImage?
    let celsius = 273
    
    init(weatherJson:NSDictionary) {
        
        
        nameCity = weatherJson["name"] as! String
        let main = weatherJson["main"] as! NSDictionary
        let kelvinTemp = main["temp"] as! Int
        temp = String(kelvinTemp - celsius) + "˚C"
        
        let weather = weatherJson["weather"] as! NSArray
        let zero = weather[0] as! NSDictionary
        description = zero["description"] as! String
        let stringIcon = zero["icon"] as! String
        icon = weatherIcon(stringIcon: stringIcon)
    }
    
    func weatherIcon(stringIcon: String) -> UIImage {
        
        let imageName: String
        
        switch stringIcon {
        case "01d": imageName = "01d"
        case "02d": imageName = "02d"
        case "03d": imageName = "03d"
        case "04d": imageName = "04d"
        case "09d": imageName = "09d"
        case "10d": imageName = "10d"
        case "11d": imageName = "11d"
        case "13d": imageName = "13d"
        case "50d": imageName = "50d"
        case "01n": imageName = "01n"
        case "02n": imageName = "02n"
        case "03n": imageName = "03n"
        case "04n": imageName = "04n"
        case "09n": imageName = "09n"
        case "10n": imageName = "10n"
        case "13n": imageName = "13n"
        case "50n": imageName = "50n"
        default: imageName = "10d"
        }
        
        var iconImage = UIImage(named: imageName)
        return iconImage!
    }
}
