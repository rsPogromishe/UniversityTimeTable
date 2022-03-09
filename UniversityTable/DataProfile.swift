//
//  DataProfile.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 20.01.2022.
//

import Foundation

class ProfileData {

    static let shared = ProfileData()

    //#warning("Не совсем то, о чём я говорил, когда с сервера будешь запихивать данные, массивы могут быть разных размеров и таблица крашнет приложение")
    let dataSubTitle = ["ФИО", "Номер группы", "Название группы", "Институт / факультет", "Форма обучения", "Квалификация", "Номер зачетной книжки", "Тема ВКР"]
    let dataMainTitle = ["Снытин Ростислав Валерьевич", "ОАБ-02.03.02-41", "Фундаментальная информатика и информационные технологии", "Институт математики, информационных технологии и физики", "Очная", "Бакалавр", "2014-99.99.99-99", "Разработка мобильной версии портала ИИАС"]

//    let arr: [ProfileProperty] = [
//        ProfileProperty.init(key: "ФИО", value: "Снытин Ростислав Валерьевич")
//    ]
    let arrayOfProfileData: [DataProfile] = [
        DataProfile.init(key: "ФИО", value: "Снытин Ростислав Валерьевич"),
        DataProfile.init(key: "Номер группы", value: "ОАБ-02.03.02-41"),
        DataProfile.init(key: "Название группы", value: "Фундаментальная информатика и информационные технологии"),
        DataProfile.init(key: "Институт / факультет", value: "Институт математики, информационных технологии и физики"),
        DataProfile.init(key: "Форма обучения", value: "Очная"),
        DataProfile.init(key: "Квалификация", value: "Бакалавр"),
        DataProfile.init(key: "Номер зачетной книжки", value: "2014-99.99.99-99"),
        DataProfile.init(key: "Тема ВКР", value: "Разработка мобильной версии портала ИИАС")
    ]

}

//struct ProfileProperty {
//    var key: String
//    var value: String
//}
struct DataProfile {
    var key: String
    var value: String
}
