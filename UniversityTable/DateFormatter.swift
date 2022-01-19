//
//  Gradient.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import Foundation
import UIKit

class DateFormat {
    static func dateToday(day: Date) -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMMM dd"
        let day = format.string(from: date)
        return day
    }
}
