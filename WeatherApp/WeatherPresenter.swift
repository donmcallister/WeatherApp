//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Donald McAllister on 9/17/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

protocol WeatherPresenter {
    var backgroundColors: [CGColor] { get }
}

class WeatherPresenterImpl: WeatherPresenter {
    var backgroundColors: [CGColor] {
        return sunnyColors
    }
    
    private let sunnyColors: [CGColor] = {
        return [UIColor.sunnyTop.cgColor, UIColor.sunnyBottom.cgColor]
    }()
    
    private let snowyColors: [CGColor] = {
        return [UIColor.snowyTop.cgColor, UIColor.snowyBottom.cgColor]
    }()
}
