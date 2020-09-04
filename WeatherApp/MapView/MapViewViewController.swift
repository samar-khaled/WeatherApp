//
//  MapViewViewController.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit
import MapKit

class MapViewViewController: UIViewController {
    // MARK: - Controls
    var mapView: MKMapView = {
        let view = MKMapView(frame: .zero)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // MARK: - variables
    private var viewModel: MapViewViewModel?

    // MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutControls()
    }

    // MARK: - Config methods
    func config(weatherData: Weather) {
        viewModel = MapViewViewModel(weatherData: weatherData)
    }

    // MARK: - private methods
    private func layoutControls() {
        self.view.backgroundColor = .systemBackground
        layoutMapView()
        if let viewModel = viewModel {
            mapView.centerToLocation(viewModel.getCityCLLocation())
            self.title = viewModel.getTemeratureSummary()
        }
    }

    private func layoutMapView() {
        view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true

        mapView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
