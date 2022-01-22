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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
