//
//  Location.swift
//  WeatherApp
//
//  Created by MOHAMED on 1/25/17.
//  Copyright © 2017 MOHAMED. All rights reserved.
//

import Foundation
import CoreLocation
class Location {
    static var sharedinstance = Location()
    private init() {
        
    }
    var Latitude : Double!
    var Longitude : Double!
    
}
