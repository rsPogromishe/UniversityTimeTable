//
//  TimeTableView.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 24.01.2022.
//

import UIKit

class TimeTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let dataLessons = data
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataLessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//#warning("Так собирать данные из массива опасно. Посмотри это https://stackoverflow.com/questions/25329186/safe-bounds-checked-array-lookup-in-swift-through-optional-bindings и проверяй, что данные точно есть")
        let lesson = dataLessons[safe: indexPath.row]
        if lesson?.type == .lesson {
            if let cell = tableView.dequeueReusableCell(withIdentifier: LessonTableViewCell.identifier, for: indexPath) as? LessonTableViewCell {
                if let lesson = dataLessons[indexPath.row] as? Lesson {
                    //#warning("Когда ячеек станет много и у них у всех будет по 10-20 полей, каждый придётся здесь описывать и увеличивать размер и так, вероятно, большого контроллера. Описывай метод конфигурации ячейки в классе ячейки")
                    cell.configure(data: lesson)
                }
                return cell
            }
        } else if lesson?.type == .breakpoint {
            if let cell = tableView.dequeueReusableCell(withIdentifier: BreakTableViewCell.identifier, for: indexPath) as? BreakTableViewCell {
                if let lesson = dataLessons[indexPath.row] as? Break {
                    cell.configure(data: lesson)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    @IBOutlet weak var timeTableView: UITableView!
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("TimeTableView", owner: self, options: nil)
        addSubview(contentView)
        registerTableViewCells(tableView: self.timeTableView)
        timeTableView.delegate = self
        timeTableView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        timeTableView.reloadData()
    }
    
    private func registerTableViewCells(tableView: UITableView) {
        let lessonCell = UINib(nibName: "LessonTableViewCell", bundle: nil)
        tableView.register(lessonCell, forCellReuseIdentifier: LessonTableViewCell.identifier)
        let breakCell = UINib(nibName: "BreakTableViewCell", bundle: nil)
        tableView.register(breakCell, forCellReuseIdentifier: BreakTableViewCell.identifier)
    }
}
