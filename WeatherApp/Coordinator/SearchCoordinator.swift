//
//  SearchCoordinator.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

class SearchCoordinator: Coordinator {
    let rootViewController: UINavigationController
    let weatherData: WeatherData

    init(rootViewController: UINavigationController, weatherData: WeatherData) {
        self.rootViewController = rootViewController
        self.weatherData = weatherData
    }

    func start() {
        let viewController = WeatherDetailsViewController()
        viewController.config(weatherData: weatherData)
        self.rootViewController.pushViewController(viewController, animated: true)
    }
}
