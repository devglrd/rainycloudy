//
//  Constants.swift
//  rainycloudy
//
//  Created by Remi Guillard on 09/10/2017.
//  Copyright © 2017 Remi Guillard. All rights reserved.
//

import Foundation

let BASE_URL = "https://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let lONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "d01bacde4adfc92b4302bc86bc47aa6d"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-35\(lONGITUDE)139.01\(APP_ID)\(APP_KEY)"
