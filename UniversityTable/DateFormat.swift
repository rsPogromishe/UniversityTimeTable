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
        format.dateFormat = "dd MMMM"
        format.locale = Locale(identifier: "ru_RU")
        let day = format.string(from: date)
        return day
    }
    static func weekDay(day: Date) -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "EEEE"
        format.locale = Locale(identifier: "ru_RU")
        let day = format.string(from: date)
        return day
    }
    static func yesterday(day: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "dd MMMM"
        format.locale = Locale(identifier: "ru_RU")
        let previousDate = day
        let previousDateFormat: Date? = format.date(from: previousDate)
        let date = Calendar.current.date(byAdding: .day, value: -1, to: previousDateFormat!)
        let stringDate = format.string(from: date!)
        return stringDate
    }
    static func yesterdayWeek(day: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "EEEE"
        format.locale = Locale(identifier: "ru_RU")
        let previousDate = day
        let previousDateFormat: Date? = format.date(from: previousDate)
        let date = Calendar.current.date(byAdding: .day, value: -1, to: previousDateFormat!)
        let stringDate = format.string(from: date!)
        return stringDate
    }
    static func tomorrow(day: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "dd MMMM"
        format.locale = Locale(identifier: "ru_RU")
        let previousDate = day
        let previousDateFormat: Date? = format.date(from: previousDate)
        let date = Calendar.current.date(byAdding: .day, value: 1, to: previousDateFormat!)
        let stringDate = format.string(from: date!)
        return stringDate
    }
    static func tomorrowWeek(day: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "EEEE"
        format.locale = Locale(identifier: "ru_RU")
        let previousDate = day
        let previousDateFormat: Date? = format.date(from: previousDate)
        let date = Calendar.current.date(byAdding: .day, value: 1, to: previousDateFormat!)
        let stringDate = format.string(from: date!)
        return stringDate
    }
}
