//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by MOHAMED on 1/22/17.
//  Copyright © 2017 MOHAMED. All rights reserved.
//

import Foundation
import Alamofire
class CurrentWeather {
    
    var _cityName :String!
    var _date :String!
    var _weatherType :String!
    var _currentTemp :Double!
    
    // Check City Name
    var cityName :String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    // Check Weather Type
    
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    
    }
    // Check Current Temp 
    var currentTemp : Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        
        return _currentTemp
    }
    
    // Check Date
    
    var date : String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let CurrentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(CurrentDate)"
        
        
        return _date
    }
    
        
    func DownloadWeatherDetails(completed: @escaping DownloadCompleted) {
    
    let currenturl = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currenturl , method:.get).responseJSON{ response in
    let result = response.result
    
            if let dict = result.value as? Dictionary <String , AnyObject> {
            // City Name 
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    }
                //Weather Type
                if let wether = dict["weather"] as? [Dictionary <String , AnyObject>] {
                    
                    if  let main = wether[0]["main"] as? String {
                        
                        self._weatherType = main.capitalized
                        
                        print(self._weatherType)
                    }
                }
                // Temp
                if let CurrentTemperture = dict["main"] as? Dictionary<String ,AnyObject> {
                    
                    if let Temp = CurrentTemperture["temp"] as? Double {
                        let kelvinToFarenheitPreDivision = (Temp * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                        print(Temp)
                    }
                }
            }
            completed()
    }
    
    
    
    }

}
