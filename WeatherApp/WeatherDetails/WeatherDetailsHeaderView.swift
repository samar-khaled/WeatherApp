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
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        label.textColor = .systemBlue
        return label
    }()

    let currentConditionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
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
        layoutDateLabel()
        layoutTemperatureLabel()
        layoutCurrentConditionImageView()
        layoutCurrentConditionLabel()
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
        temperatureLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }

    fileprivate func layoutCurrentConditionImageView() {
        self.addSubview(currentConditionImageView)
        currentConditionImageView.topAnchor.constraint(
            equalTo: self.topAnchor, constant: marginConstant).isActive = true
        currentConditionImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        currentConditionImageView.rightAnchor.constraint(
            equalTo: self.rightAnchor, constant: marginConstant).isActive = true
        currentConditionImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    fileprivate func layoutCurrentConditionLabel() {
        self.addSubview(currentConditionLabel)
        currentConditionLabel.topAnchor.constraint(
            equalTo: temperatureLabel.bottomAnchor, constant: marginConstant).isActive = true
        currentConditionLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        currentConditionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: marginConstant).isActive = true
        currentConditionLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }

    // MARK: - helper func
    func getViewHeight() -> CGFloat {
        return 140
    }

    func config(weatherData: Weather) {
        self.weatherData = weatherData
        dateLabel.text = weatherData.getDateTextNow()
        temperatureLabel.text = weatherData.getTemperatureTextNow()
        currentConditionLabel.text = weatherData.getCurrentConditionTextNow()
        if let imageName = weatherData.getCurrentConditionImageTextNow() {
            currentConditionImageView.load(url: WeatherService().getImageUrl(imageName: imageName)
            )
        }
    }
}
