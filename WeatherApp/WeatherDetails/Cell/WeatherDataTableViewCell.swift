//
//  WeatherDataTableViewCell.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

class WeatherDataTableViewCell: UITableViewCell {
    // MARK: - Constants
    static let cellIdentifier = "WeatherDataTableViewCell"
    static let cellNib = "WeatherDataTableViewCell"
    static let cellHeight: CGFloat = 81
    
    var weatherForecast: WeatherForecast?
    // MARK: - Controls
    // MARK: - awake from Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    // MARK: - private func
    private func setupUI() {
    }
}
