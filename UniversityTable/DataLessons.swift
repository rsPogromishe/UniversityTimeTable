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
enum LessonTypeView {
    case lection
    case laboratory
    case practicum
}
protocol LessonProtocol {
    var timeStart: String { get set }
    var nameLesson: String { get set }
    var type: TypeLesson { get set }
}
struct Lesson: LessonProtocol {
    var type: TypeLesson
    var timeStart: String
    var nameLesson: String
    
    var timeEnd: String
    var nameTeacher: String
    var cabinetNumber: String
    var lessonType: LessonTypeView
}
struct Break: LessonProtocol {
    var type: TypeLesson
    var timeStart: String
    var nameLesson: String
}

let firstLesson = Lesson.init(type: .lesson, timeStart: "10:00", nameLesson: "Cистемный и логический анализ", timeEnd: "11:30", nameTeacher: "Бельтюков А.С.", cabinetNumber: "325/6к", lessonType: .lection)
let firstBreak = Break.init(type: .breakpoint, timeStart: "11:30", nameLesson: "Перерыв")
let secondLesson = Lesson.init(type: .lesson, timeStart: "12:10", nameLesson: "Системный и логический анализ", timeEnd: "13:40", nameTeacher: "Лукьянов А.С.", cabinetNumber: "325/6к", lessonType: .laboratory)
let thirdLesson = Lesson.init(type: .lesson, timeStart: "13:50", nameLesson: "Программирование в .net", timeEnd: "15:20", nameTeacher: "Трусов А.С.", cabinetNumber: "325/6к", lessonType: .laboratory)
let secondBreak = Break.init(type: .breakpoint, timeStart: "15:20", nameLesson: "Перерыв")
let fourthLesson = Lesson.init(type: .lesson, timeStart: "15:50", nameLesson: "Программирование в .net", timeEnd: "17:20", nameTeacher: "Трусов А.С.", cabinetNumber: "325/6к", lessonType: .practicum)

let data: [LessonProtocol] = [ firstLesson, firstBreak, secondLesson, thirdLesson, secondBreak, fourthLesson ]



