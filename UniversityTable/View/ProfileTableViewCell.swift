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
    
    func configure(key: String, value: String) {
        subTitle.text = key
        mainTitle.text = value
    }
}
