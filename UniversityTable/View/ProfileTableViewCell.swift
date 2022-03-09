//
//  ProfileTableViewCell.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 20.01.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"

    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    
    //#warning("Не используемые методы можно удалить, зря место занимают")
    //#warning("Selection в данной задаче у ячейки не нужен")
    func configure(key: String, value: String) {
        subTitle.text = key
        mainTitle.text = value
    }
}
