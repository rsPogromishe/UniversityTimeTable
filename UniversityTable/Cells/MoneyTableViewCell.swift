//
//  MoneyTableViewCell.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {

    static let identifier = "MoneyTableViewCell"
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var vectorLabel: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func vectorButtonTapped(_ sender: UIButton) {
            if vectorLabel.transform == CGAffineTransform(rotationAngle: CGFloat.zero) {
                vectorLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.frame.size.height = 121
            } else {
                vectorLabel.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
                self.frame.size.height = 48
            }
        
    }
}
