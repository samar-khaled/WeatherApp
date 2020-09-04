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
    let weatherDetailsHeaderView: WeatherDetailsHeaderView = {
        let view = WeatherDetailsHeaderView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var weatherTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.alwaysBounceVertical = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - variables
    private var weatherData: Weather?
    private var viewModel: WeatherDetailsViewModel?
    var weatherTableViewHeightAnchor: NSLayoutConstraint?

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutControls()
    }
    // MARK: - Config methods
    func config(weatherData: Weather) {
        self.weatherData = weatherData
        viewModel = WeatherDetailsViewModel(weatherData: weatherData)
    }

    // MARK: - private methods
    private func layoutControls() {
        self.view.backgroundColor = .systemBackground
        if let viewModel = viewModel {
            self.title = viewModel.getCityName()
        }
        layoutHeaderView()
        if let weatherData = weatherData {
            weatherDetailsHeaderView.config(weatherData: weatherData)
        }
        layoutTableView()
    }

    private func layoutHeaderView() {
        view.addSubview(weatherDetailsHeaderView)
        if #available(iOS 11.0, *) {
            weatherDetailsHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        } else {
            weatherDetailsHeaderView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        weatherDetailsHeaderView.heightAnchor.constraint(
            equalToConstant: weatherDetailsHeaderView.getViewHeight()
        ).isActive = true
        weatherDetailsHeaderView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        weatherDetailsHeaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func layoutTableView() {
        view.addSubview(weatherTableView)
        let height = WeatherDataTableViewCell.cellHeight * CGFloat(weatherData?.list.count ?? 0)
        weatherTableViewHeightAnchor = weatherTableView.heightAnchor.constraint(equalToConstant: height)
        weatherTableViewHeightAnchor?.priority = UILayoutPriority.defaultHigh
        weatherTableViewHeightAnchor?.isActive = true
        weatherTableView.topAnchor.constraint(
            equalTo: weatherDetailsHeaderView.bottomAnchor,
            constant: 16
        ).isActive = true
        weatherTableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        weatherTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if #available(iOS 11.0, *) {
            weatherTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        weatherTableView.register(
            UINib(nibName: WeatherDataTableViewCell.cellNib, bundle: nil),
            forCellReuseIdentifier: WeatherDataTableViewCell.cellIdentifier)
    }
}

extension WeatherDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let weatherData = weatherData else { return 0 }
        return weatherData.list.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return WeatherDataTableViewCell.cellHeight
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weatherData = weatherData else {
            return UITableViewCell()
        }
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: WeatherDataTableViewCell.cellIdentifier,
            for: indexPath
            ) as? WeatherDataTableViewCell {

            cell.config(weatherForecast: weatherData.list[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
