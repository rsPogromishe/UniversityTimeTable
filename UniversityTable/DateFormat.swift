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
    //#warning("2 метода делают практически одно и тоже. Получают строку из даты, меняется только одна переменная, можно 2 метода совместить в один, как выше")
    static func dateToday(day: Date, formatter: String) -> String {
        let format = DateFormatter()
        format.dateFormat = formatter
        format.locale = Locale(identifier: "ru_RU")
        return format.string(from: day)
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
    //#warning("Можно получить прошлую дату из даты")
    static func yesterday(day: String, formatter: String) -> String {
        let format = DateFormatter()
        format.dateFormat = formatter
        format.locale = Locale(identifier: "ru_RU")
        //#warning("2 строчки кода в одну")
        guard let previousDate = format.date(from: day) else {
            return ""
        }
        //#warning("Чтоб не переживать, что в какой-то момент этот метод не сработает, лучше поставить проверку, пример выше")
        let date = Calendar.current.date(byAdding: .day, value: -1, to: previousDate)
        guard let date = date else {
            return ""
        }
        
        return format.string(from: date)
    }
    
    static func tomorrow(day: String, formatter: String) -> String {
        let format = DateFormatter()
        format.dateFormat = formatter
        format.locale = Locale(identifier: "ru_RU")
        guard let previousDateFormat = format.date(from: day) else {
            return ""
        }
        
        let date = Calendar.current.date(byAdding: .day, value: 1, to: previousDateFormat)
        guard let date = date else {
            return ""
        }
        return format.string(from: date)
    }
    
    static func datesRange(from: Date, to: Date) -> [String] {
        if from > to { return [String]() }
        let tempDate = from
        var array: [String] = []
        while tempDate < to {
            guard let tempDate = Calendar.current.date(byAdding: .month, value: 1, to: tempDate) else {
                return [""]
            }
            let format = DateFormatter()
            format.locale = Locale(identifier: "ru_RU")
            format.dateFormat = "LLLL"
            let tempDateString = format.string(from: tempDate).capitalized
            array.append(tempDateString)
        }
        
        return array
    }
    
    func thisWeek() -> [String] {
        let arrayWeekDay = Date().getWeekDates()
        var array: [String] = []
        for i in arrayWeekDay.thisWeek {
            let a = i.toDate(format: "dd")
            array.append(a)
        }
        return array
    }
    
    func nextWeek() -> [String] {
        let arrayWeekDay = Date().getWeekDates()
        var array: [String] = []
        for i in arrayWeekDay.nextWeek {
            let a = i.toDate(format: "dd")
            array.append(a)
        }
        return array
    }
}

extension Date {

    var startOfWeek: Date {
        let gregorian = Calendar(identifier: .gregorian)
        let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))
        guard let sunday = sunday else {
            return Date()
        }
        return gregorian.date(byAdding: .day, value: 1, to: sunday) ?? Date()
    }

    func toDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func getWeekDates() -> (thisWeek:[Date], nextWeek:[Date]) {
        var tuple: (thisWeek:[Date],nextWeek:[Date])
        var arrThisWeek: [Date] = []
        for i in 0..<7 {
            arrThisWeek.append(Calendar.current.date(byAdding: .day, value: i, to: startOfWeek) ?? Date())
        }
        var arrNextWeek: [Date] = []
        for i in 1...7 {
            arrNextWeek.append(Calendar.current.date(byAdding: .day, value: i, to: arrThisWeek.last ?? Date()) ?? Date())
        }
        tuple = (thisWeek: arrThisWeek, nextWeek: arrNextWeek)
        return tuple
    }

}
