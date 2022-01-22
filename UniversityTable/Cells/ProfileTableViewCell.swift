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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
