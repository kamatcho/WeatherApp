//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by MOHAMED on 1/20/17.
//  Copyright © 2017 MOHAMED. All rights reserved.
//

import UIKit

import Alamofire

import CoreLocation
class WeatherVC: UIViewController , UITableViewDelegate , UITableViewDataSource,CLLocationManagerDelegate{

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var CurrentWeatherImage: UIImageView!
    @IBOutlet weak var CurrentWeatherTypeLabel: UILabel!
    @IBOutlet weak var TableView: UITableView!
    var forcast : Forcast!
    
    var forcasts = [Forcast]()
    var currentWeather : CurrentWeather!
    var locationManager = CLLocationManager()
    var currentLocation :CLLocation!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        UserLocation()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        TableView.delegate = self
        TableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.DownloadWeatherDetails {
            self.DownloadDayesWeather {
                self.UpdateUI()
            }
            
            
        }
        
        
    }
    
    func UserLocation() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedinstance.Latitude = currentLocation.coordinate.latitude
            Location.sharedinstance.Longitude = currentLocation.coordinate.longitude
            print(Location.sharedinstance.Latitude , Location.sharedinstance.Longitude)
        } else {
            locationManager.requestWhenInUseAuthorization()
            UserLocation()
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            
            let forecast = forcasts[indexPath.row]
            cell.ConfigureCell(forcast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func DownloadDayesWeather(completed :  @escaping DownloadCompleted)  {
        let ForcastUrl = URL(string: DAYSURL)!
        
        Alamofire.request(ForcastUrl ,method:.get).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                  
                    for obj in list {
                        let forecast = Forcast(WeatherDict: obj)
                        self.forcasts.append(forecast)
                    
                    }
                    self.forcasts.remove(at: 0)
                    self.TableView.reloadData()
                    
                    
                }
             completed()
            }
        
        }
    }

    func UpdateUI(){
        DateLabel.text = currentWeather.date
        LocationLabel.text = currentWeather.cityName
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        CurrentWeatherTypeLabel.text = currentWeather.weatherType
        CurrentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        print(currentWeather.weatherType)
        
    }
    

}

