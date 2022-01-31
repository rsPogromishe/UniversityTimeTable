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
    
    @IBOutlet weak var buttonBottomConst: NSLayoutConstraint!
    @IBOutlet weak var paymentBottomConst: NSLayoutConstraint!
    
    var selectedRow = false
    
    #warning("Не используемые методы можно удалить, зря место занимают")
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    #warning("IBAction убрать и передаваемый параметр тоже не нужен")
    @IBAction func vectorButtonTapped(_ sender: UIButton) {
            if selectedRow {
                vectorLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                //self.buttonBottomConst.priority = UILayoutPriority(rawValue: 998)
                
            } else {
                vectorLabel.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
                //self.buttonBottomConst.priority = UILayoutPriority(rawValue: 1000)
            }
            
    }
}
