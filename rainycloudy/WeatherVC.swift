//
//  WeatherVC.swift
//  rainycloudy
//
//  Created by Remi Guillard on 09/10/2017.
//  Copyright © 2017 Remi Guillard. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentTempLb: UILabel!
    
    //je stock une intialisation de currenWeather ma class
    //depuis elle je peux ressortir mes varirables 
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails{
            self.updateUI()
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateUI(){
            dateLbl.text = currentWeather.date
            currentTempLb.text = "\(currentWeather.currentTemp)"
            currentWeatherTypeLbl.text = currentWeather.weatherType
            locationLbl.text = currentWeather.cityName
            currentWeatherImg.image = UIImage(named: currentWeather.weatherType)
    }
    
    
}

