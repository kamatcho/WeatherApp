//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by MOHAMED on 1/23/17.
//  Copyright © 2017 MOHAMED. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {


    @IBOutlet weak var WeatherIcon: UIImageView!
    
    @IBOutlet weak var DayLabel: UILabel!
    
    @IBOutlet weak var LowTempLabel: UILabel!
    @IBOutlet weak var HighTempLabel: UILabel!
    @IBOutlet weak var WeatherTypeLabel: UILabel!
    func ConfigureCell(forcast: Forcast)  {
        LowTempLabel.text = forcast.lowTemp
        HighTempLabel.text = forcast.hightTemp
        WeatherTypeLabel.text = forcast.weatherType
        DayLabel.text = forcast.date
        WeatherIcon.image = UIImage(named: forcast.weatherType)
        
        }
}
