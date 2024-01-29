//
//  CurrentData.swift
//  WeatherDataFetching(Weather_Api)
//
//  Created by Mac on 29/01/24.
//

import Foundation
struct CurrentData: Codable
{
    let last_updated : String
    let temp_c : Float
    let wind_kph : Float
    let humidity : Int
}
