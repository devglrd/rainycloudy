//
//  CurrentWeather.swift
//  rainycloudy
//
//  Created by Remi Guillard on 09/10/2017.
//  Copyright © 2017 Remi Guillard. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather{
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String{
        if _cityName == nil {
             _cityName = ""
        }
        return _cityName
    }
    var date: String{
        if _date == nil{
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today : \(currentDate)"
        return _date
    }
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            print(response)
            if let dict = result.value as? Dictionary<String, Any>{
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, Any>]{
                    if let type = weather[0]["main"] as? String{
                        self._weatherType = type.capitalized
                        print(self._weatherType)
                    }
                }
                if let temp = dict["main"] as? Dictionary<String, Any>{
                    //on rentre dans le dic racine c'est pourquoi on reutilise temp
                    if let currentTemperature = temp["temp"] as? Double{
                        let kelvinto = (currentTemperature * (9/5) - 459.67)
                        let kelvin = Double(round(10 * kelvinto/10))
                        
                        self._currentTemp = kelvin
                        print(self.currentTemp)
                    }
                }
            }
        }
        completed()
    }
}
