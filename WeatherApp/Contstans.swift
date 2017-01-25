//
//  Contstans.swift
//  WeatherApp
//
//  Created by MOHAMED on 1/22/17.
//  Copyright © 2017 MOHAMED. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat="

let LONGITUDE = "&lon="

let APP_ID = "&appid="
let APP_KEY = "fa1c1285e0221c360f7182d86a190bf7"

typealias DownloadCompleted = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedinstance.Latitude!)\(LONGITUDE)\(Location.sharedinstance.Longitude!)\(APP_ID)\(APP_KEY)"

let DAYSURL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedinstance.Latitude!)&lon=\(Location.sharedinstance.Longitude!)&cnt=10&mode=json&appid=fa1c1285e0221c360f7182d86a190bf7"








