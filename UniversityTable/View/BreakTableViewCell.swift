//
//  BreakTableViewCell.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class BreakTableViewCell: UITableViewCell {
    
    static let identifier = "BreakTableViewCell"

    @IBOutlet weak var breakStartLabel: UILabel!
    @IBOutlet weak var nameBreakLabel: UILabel!
    
    func configure(data: Break) {
        breakStartLabel.text = data.timeStart
        nameBreakLabel.text = data.nameLesson
    }
}
