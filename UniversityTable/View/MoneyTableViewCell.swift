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
    
    func vectorButtonTapped() {
        if selectedRow {
            vectorLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        } else {
            vectorLabel.transform = CGAffineTransform(rotationAngle: CGFloat.zero)
        }
    }
    
    func configure(month: String) {
        monthLabel.text = month
    }
}
