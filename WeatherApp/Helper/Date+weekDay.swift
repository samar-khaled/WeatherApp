//
//  Date+weekDay.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/5/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
}
