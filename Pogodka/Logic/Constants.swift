//
//  Constants.swift
//  Pogodka
//
//  Created by Viktor Olesenko on 26.03.17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import Foundation

enum Temperature {
    case Celsius(absoluteValue: Int)
    
    
    var value: Double {
        switch self {
        case .Celsius(let absoluteValue): return Double(absoluteValue) + 273.15
        }
    }
    
    var symbol: String {
        switch self {
        case .Celsius(_): return "˚C"
        }
    }
}

struct Key {
    
    struct OpenWeather {
        static let name = "name"
    }
    
}
