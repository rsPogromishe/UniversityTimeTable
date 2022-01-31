//
//  ProfileTableViewCell.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 20.01.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    static let identifier = "ProfileTableViewCell"

    @IBOutlet weak var subTitile: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    
    #warning("Не используемые методы можно удалить, зря место занимают")
    #warning("Selection в данной задаче у ячейки не нужен")
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
