//
//  UIViewController+AddViewController.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

extension UIViewController {
    func addViewController(viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func removeViewController(viewController: UIViewController) {
        DispatchQueue.main.async {
            viewController.willMove(toParent: nil)
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }
    }
}
