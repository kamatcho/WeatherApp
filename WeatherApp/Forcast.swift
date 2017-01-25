//
//  Forcast.swift
//  WeatherApp
//
//  Created by MOHAMED on 1/22/17.
//  Copyright © 2017 MOHAMED. All rights reserved.
//

import UIKit

class Forcast {
    var _date :String!
    var _lowTemp :String!
    var _highTemp :String!
    var _weatherType :String!
    
    
    
    var lowTemp :String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    var hightTemp : String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var date :String{
        if _date == nil {
            _date = ""
        }
        return _date
    }
    init(WeatherDict: Dictionary <String , AnyObject>) {
        if  let main = WeatherDict["temp"] as? Dictionary<String ,AnyObject>{
            if  let lowtemperature = main["min"] as? Double {
                let kelvinToFarenheitPreDivision = (lowtemperature * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._lowTemp = "\(kelvinToFarenheit)"
                
            }
            if let hightemperature = main["max"] as? Double {
                let kelvinToFarenheitPreDivision = (hightemperature * (9/5) - 459.67)
                
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                
                self._highTemp = "\(kelvinToFarenheit)"
            }
            
        }
        if let weather = WeatherDict["weather"] as? [Dictionary < String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                print(main)
                self._weatherType = main
            }
        }
        if let date = WeatherDict["dt"] as? Double {
           let UnixDateConverter = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = "\(UnixDateConverter.dayOfTheWeek())"
        }
    }
   
}


extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}





