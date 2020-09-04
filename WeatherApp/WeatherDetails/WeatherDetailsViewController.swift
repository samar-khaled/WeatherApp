//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

class WeatherDetailsViewController: UIViewController {
    // MARK: - Controls
    let headerView: WeatherDetailsHeaderView = {
        let view = WeatherDetailsHeaderView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - variables
    var weatherData: Weather?
    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
