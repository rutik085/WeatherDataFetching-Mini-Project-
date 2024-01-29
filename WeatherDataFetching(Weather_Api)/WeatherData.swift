//
//  WeatherData.swift
//  WeatherDataFetching(Weather_Api)
//
//  Created by Mac on 29/01/24.
//

import Foundation
struct WeatherData : Codable
{
    let location : LocationData
    let current : CurrentData
}
