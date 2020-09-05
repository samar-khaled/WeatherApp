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
    static let cellHeight: CGFloat = 200
    // MARK: - Controls
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var precipitationLabel: UILabel!
    @IBOutlet weak var currentConditionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    private var weatherForecast: WeatherForecastData?
    // MARK: - awake from Nib
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - helper func
    func config(weatherForecast: WeatherForecastData) {
        self.weatherForecast = weatherForecast
        dateLable.text = weatherForecast.getDateText()
        temperatureLabel.text = weatherForecast.getTemperatureData().getTempatureText()
        humidityLabel.text = weatherForecast.getTemperatureData().getHumidityText()
        pressureLabel.text = weatherForecast.getTemperatureData().getPressureText()
        precipitationLabel.text = weatherForecast.getPrecipitationText()
        feelsLikeLabel.text = weatherForecast.getTemperatureData().getFeelsLikeText()
        currentConditionLabel.text = weatherForecast.getCurrentConditionText()
        if let imageName = weatherForecast.getCurrentConditionImageText() {
            statusImageView.load(url: WeatherService().getImageUrl(imageName: imageName)
            )
        }
    }
}
