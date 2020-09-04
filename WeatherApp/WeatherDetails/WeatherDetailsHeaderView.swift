//
//  WeatherDetailsHeaderView.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//
import Foundation
import UIKit

class WeatherDetailsHeaderView: UIView {
    // MARK: - Constants
    let marginConstant: CGFloat = 8
    // MARK: - Controls
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .gray
        return label
    }()

    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .semibold)
        label.textColor = .black
        return label
    }()

    let currentConditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .black
        return label
    }()

    let currentConditionImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let viewMap: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Map", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        return button
    }()
    // MARK: - 
    var weatherData: Weather?
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutControls()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - private func
    fileprivate func layoutControls() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.alpha = 0.7
        layoutDateLabel()
        layoutTemperatureLabel()
    }

    fileprivate func layoutDateLabel() {
        self.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: marginConstant).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: marginConstant).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

    fileprivate func layoutTemperatureLabel() {
        self.addSubview(temperatureLabel)
        temperatureLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: marginConstant).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        temperatureLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: marginConstant).isActive = true
        temperatureLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }

    // MARK: - helper func
    func getViewHeight() -> CGFloat {
        return 150
    }

    func config(weatherData: Weather) {
        self.weatherData = weatherData
        dateLabel.text = weatherData.getDateTextNow()
        temperatureLabel.text = weatherData.getTemperatureTextNow()
        currentConditionLabel.text = weatherData.getCurrentConditionTextNow()
        let imageName = weatherData.getCurrentConditionImageTextNow() ?? "01d"
        currentConditionImageView.load(url:
            URL(string: "http://openweathermap.org/img/wn/\(imageName)@2x.png"
            )
        )
    }
}
