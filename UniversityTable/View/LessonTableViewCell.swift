//
//  LessonTableViewCell.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class LessonTableViewCell: UITableViewCell {
    static let identifier = "LessonTableViewCell"
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var cabinetLabel: UILabel!
    @IBOutlet weak var nameLessonLabel: UILabel!
    @IBOutlet weak var nameTeacherLabel: UILabel!
    @IBOutlet weak var typeLessonView: UIView!
    @IBOutlet weak var typeLessonLabel: UILabel!
    
    func configure(data: Lesson) {
        startTimeLabel.text = data.timeStart
        endTimeLabel.text = data.timeEnd
        cabinetLabel.text = data.cabinetNumber
        nameLessonLabel.text = data.nameLesson
        nameTeacherLabel.text = data.nameTeacher
        if data.lessonType == .lection {
            typeLessonView.backgroundColor = UIColor.setColor(red: 251, green: 188, blue: 74, alpha: 1)
            typeLessonLabel.text = "Лек"
        } else if data.lessonType == .laboratory {
            typeLessonLabel.text = "Лаб"
            typeLessonView.backgroundColor = UIColor.setColor(red: 118, green: 218, blue: 58, alpha: 1)
        } else if data.lessonType == .practicum {
            typeLessonView.backgroundColor = UIColor.setColor(red: 31, green: 184, blue: 242, alpha: 1)
            typeLessonLabel.text = "Прак"
        }
    }
}
