//
//  LessonTableViewCell.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

#warning("Выставляя ширину для UILabel и его родительской UIView(в данном случае UIStackView) приведёт к тому, что если лейблу потребуется больше места, то он начнёт обрезаться по установленной ширине, а ширина экрана всегда разная")
#warning("В UIStackView выставляй однозначную высоту/ширину у сабвью, иначе будет непредвиденная ситуация")
class LessonTableViewCell: UITableViewCell {
    
    static let identifier = "LessonTableViewCell"
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var cabinetLabel: UILabel!
    @IBOutlet weak var nameLessonLabel: UILabel!
    @IBOutlet weak var nameTeacherLabel: UILabel!
    @IBOutlet weak var typeLessonView: UIView!
    @IBOutlet weak var typeLessonLabel: UILabel!
    

    #warning("Не используемые методы можно удалить, зря место занимают")
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
