//
//  Gradient.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import Foundation
import UIKit

class DateFormat {
//    static func formatDate(date: Date, format: String = "dd MMMM") -> String {
//        let format = DateFormatter()
//        format.dateFormat = format
//        format.locale = Locale(identifier: "ru_RU")
//        return format.string(from: date)
//    }
    #warning("2 метода делают практически одно и тоже. Получают строку из даты, меняется только одна переменная, можно 2 метода совместить в один, как выше")
    static func dateToday(day: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "dd MMMM"
        format.locale = Locale(identifier: "ru_RU")
        let date = format.string(from: day)
        return date
    }
    static func weekDay(day: Date) -> String {
        let format = DateFormatter()
        format.dateFormat = "EEEE"
        format.locale = Locale(identifier: "ru_RU")
        let date = format.string(from: day)
        return date
    }
//    static func yesterday(atDate date: Date) -> String? {
//        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)
//        guard let yesterday = yesterday else {
//            return nil
//        }
//
//        let format = DateFormatter()
//        format.dateFormat = "dd MMMM"
//        format.locale = Locale(identifier: "ru_RU")
//        let stringDate = format.string(from: yesterday)
//        return stringDate
//    }
    #warning("Можно получить прошлую дату из даты")
    static func yesterday(day: String) -> String {
        let format = DateFormatter()
        format.dateFormat = "dd MMMM"
        format.locale = Locale(identifier: "ru_RU")
        #warning("2 строчки кода в одну")
        //let previousDate = format.date(from: previousDate)
        let previousDate = day
        let previousDateFormat: Date? = format.date(from: previousDate)
        #warning("Чтоб не переживать, что в какой-то момент этот метод не сработает, лучше поставить проверку, пример выше")
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
    static func datesRange(from: Date, to: Date) -> [String] {
        if from > to { return [String]() }
        var tempDate = from
        var array: [String] = []
        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .month, value: 1, to: tempDate)!
            let format = DateFormatter()
            format.locale = Locale(identifier: "ru_RU")
            format.dateFormat = "LLLL"
            let tempDateString = format.string(from: tempDate).capitalized
            array.append(tempDateString)
        }
        
        return array
    }
}
