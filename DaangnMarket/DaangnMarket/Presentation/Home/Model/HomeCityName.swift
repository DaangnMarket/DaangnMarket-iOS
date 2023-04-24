//
//  HomeCityName.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/24.
//

import UIKit

struct HomeCityName {
    var cityName: String
    
    static func fetchCityName() -> [HomeCityName] {
        return HomeCityName(cityName: "효자동")
    }
}
