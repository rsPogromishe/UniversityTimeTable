//
//  DataLessons.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 16.01.2022.
//

import Foundation

enum TypeLesson {
    case lesson
    case breakpoint
}
protocol LessonProtocol {
    var timeStart: String { get set }
    var nameLesson: String { get set }
}
struct Lesson: LessonProtocol {
    var type: TypeLesson
    var timeStart: String
    var nameLesson: String
    
    var timeEnd: String
    var nameTeacher: String
    var cabinetNumbet: String
}
struct Break: LessonProtocol {
    var type: TypeLesson
    var timeStart: String
    var nameLesson: String
}
let lesson1 = Lesson.init(type: .lesson, timeStart: "10:00", nameLesson: "Cистемный и логический анализ", timeEnd: "11:30", nameTeacher: "Бельтюков А.С.", cabinetNumbet: "325/6к")
let break1 = Break.init(type: .breakpoint, timeStart: "11:30", nameLesson: "Перерыв")
let lesson2 = Lesson.init(type: .lesson, timeStart: "12:10", nameLesson: "Системный и логический анализ", timeEnd: "13:40", nameTeacher: "Лукьянов А.С.", cabinetNumbet: "325/6к")
let lesson3 = Lesson.init(type: .lesson, timeStart: "13:50", nameLesson: "Программирование в .net", timeEnd: "15:20", nameTeacher: "Трусов А.С.", cabinetNumbet: "325/6к")
let break2 = Break.init(type: .breakpoint, timeStart: "15:20", nameLesson: "Перерыв")
let lesson4 = Lesson.init(type: .lesson, timeStart: "16:00", nameLesson: "Программирование в .net", timeEnd: "17:30", nameTeacher: "Трусов А.С.", cabinetNumbet: "325/6к")

let data: [LessonProtocol] = [ lesson1, break1, lesson2, lesson3, break2, lesson4 ]

