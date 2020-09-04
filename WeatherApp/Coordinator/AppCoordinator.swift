//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true

        let viewController = WeatherSearchViewController()
        rootViewController.pushViewController(viewController, animated: false)
    }

    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
