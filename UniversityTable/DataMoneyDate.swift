//
//  DataMoneyDate.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 25.01.2022.
//

import Foundation


let today = Date()
let oneYearAgo = Calendar.current.date(byAdding: .year, value: -1, to: today)

let range = DateFormat.datesRange(from: oneYearAgo!, to: today)

class DataMoneyDate {
    static let shared = DataMoneyDate()
    let month = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
}
