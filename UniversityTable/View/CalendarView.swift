//
//  CalendarView.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 23.02.2022.
//

import Foundation
import UIKit

protocol CalendarViewDelegate: AnyObject {
    func changeDateDelegate(tag: Int)
}

class CalendarView: UIView {
    
    var delegate: CalendarViewDelegate?
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var firstWeekButton: [UIButton]!
    @IBOutlet var secondWeekButton: [UIButton]!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CalendarView", owner: self, options: nil)
        addSubview(contentView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
    }
    
    func configure(model: DateFormat) {
        for (index, item) in firstWeekButton.enumerated() {
            item.setTitle((Date().getWeekDates().thisWeek[index]).toDate(format: "dd"), for: .normal)
        }
        
        for (index, item) in secondWeekButton.enumerated() {
            item.setTitle((Date().getWeekDates().nextWeek[index]).toDate(format: "dd"), for: .normal)
        }
        
        for (_, i) in firstWeekButton.enumerated() {
            if i.currentTitle == DateFormat.dateToday(day: Date(), formatter: "dd") {
                i.backgroundColor = UIColor.setColor(red: 251, green: 188, blue: 74, alpha: 1)
                i.layer.cornerRadius = 13
            }
        }
    }
    
    @IBAction func firstWeekButtonPressed(_ sender: UIButton) {
        let tag = sender.tag
        delegate?.changeDateDelegate(tag: tag)
    }
    
}
