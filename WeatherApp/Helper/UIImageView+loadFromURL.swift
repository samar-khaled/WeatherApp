//
//  UIImageView+loadFromURL.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/4/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func load(url: URL?) {
        guard let url = url else { return }
        self.kf.setImage(with: url)
    }
}
