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
    let celsiusDiff = 273
    let celsius = "˚C"
    
    init(weatherJson:NSDictionary) {
        
        nameCity = weatherJson["name"] as! String
        
        let main = weatherJson["main"] as! NSDictionary
        let kelvinTemp = main["temp"] as! Int
        temp = String(kelvinTemp - celsiusDiff) + celsius
        
        let weather = weatherJson["weather"] as! NSArray
        let zero = weather[0] as! NSDictionary
        description = zero["description"] as! String
        
        let stringIcon = zero["icon"] as! String
        icon = weatherIcon(stringIcon: stringIcon)
    }
    
    func weatherIcon(stringIcon: String) -> UIImage {
        return UIImage(named: stringIcon) ?? UIImage(named: "10d")!
    }
}
