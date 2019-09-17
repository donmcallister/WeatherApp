//
//  ViewController.swift
//  WeatherApp
//
//  Created by Donald McAllister on 9/17/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    //to change self view of view controller
    var mainView: WeatherView! { return (self.view as! WeatherView) }
    
    let presenter: WeatherPresenter!
    
    init(with presenter: WeatherPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBackground()
       
    }
    
    func updateBackground() {
        // moved to presenter class:
//        let startColor = UIColor(red: 250/255, green: 85/255, blue: 56/255, alpha: 1)
//        let endColor = UIColor(red: 250/255, green: 50/255, blue: 82/255, alpha: 1)
        
//        self.mainView.updateGradient([startColor.cgColor, endColor.cgColor]) <-- replace with property from the presenter
        self.mainView.updateGradient(presenter.backgroundColors)
    }

    override func loadView() {
        self.view = WeatherView(frame: UIScreen.main.bounds)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        let isLandscape = size.width > size.height
        if isLandscape {
            mainView.centerContentStackView.axis = .horizontal
        } else {
            mainView.centerContentStackView.axis = .vertical
        }
    }

}

