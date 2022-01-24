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
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
