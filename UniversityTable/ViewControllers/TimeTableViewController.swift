//
//  TimeTableViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import UIKit

#warning("На iPhone SE 2 не работают кнопки след/пред раписание")
class TimeTableViewController: UIViewController, UIScrollViewDelegate, CalendarViewDelegate {
    
    lazy var dayToday = Date()
    
    let dataLessons = data
    
    let calendarDates = DateFormat().thisWeek() + DateFormat().nextWeek()
    let calendar = Date().getWeekDates().thisWeek + Date().getWeekDates().nextWeek
    
    var currentDate: String = ""
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekDateLabel: UILabel!
    
    @IBOutlet weak var pagingScroll: UIScrollView!
    
    @IBOutlet weak var calendarView: CalendarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = DateFormat.dateToday(day: dayToday, formatter: "dd MMMM")
        weekDateLabel.text = DateFormat.dateToday(day: dayToday, formatter: "EEEE")
        
        self.view.bringSubviewToFront(calendarView)
        calendarView.isHidden = true
        calendarView.configure(model: DateFormat(), currentDate: dateLabel.text ?? "")
        
        pagingScroll.delegate = self
        pagingScroll.isPagingEnabled = true
        pagingScroll.alwaysBounceVertical = false
        
        calendarView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let numberOfPages: Int = calendar.count - 1
        let heightScroll = UIScreen.main.bounds.height - (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0) - (self.tabBarController?.tabBar.frame.height ?? 0) - 67
        let widthScroll = UIScreen.main.bounds.width
        self.pagingScroll.contentSize = CGSize(width: widthScroll * 14,
                                               height: 0)
        
        for i in 0...numberOfPages {
            let frame: CGRect = CGRect(x: widthScroll * CGFloat(i), y: 0, width: widthScroll, height: heightScroll)
            let tableview = TimeTableView.init(frame: frame)
            pagingScroll.addSubview(tableview)
        }
        
        contentOffSet(index: indexOfDate(date: dayToday.toDate(format: "dd MMMM")))
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        var array: [String] = []
        for i in dataLessons {
            let name = i.nameLesson
            let time = i.timeStart
            array.append(time)
            array.append(name)
        }
        let sharedData = "Пары на \(self.dateLabel.text ?? ""),\(self.weekDateLabel.text ?? ""): \(array)"
        let activityVC = UIActivityViewController(activityItems: [sharedData], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        var array: [String] = []
        for i in calendar {
            let a = i.toDate(format: "dd MMMM")
            array.append(a)
        }
        if array.contains(DateFormat.yesterday(day: dateLabel.text ?? "", formatter: "dd MMMM")){
            dateLabel.text = DateFormat.yesterday(day: dateLabel.text ?? "", formatter: "dd MMMM")
            weekDateLabel.text = DateFormat.yesterday(day: weekDateLabel.text ?? "", formatter: "EEEE")
            contentOffSet(index: indexOfDate(date: dateLabel.text ?? ""))
        } else {
            dateLabel.text = dateLabel.text
            weekDateLabel.text = weekDateLabel.text
            contentOffSet(index: indexOfDate(date: dateLabel.text ?? ""))
        }
        
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        var array: [String] = []
        for i in calendar {
            let a = i.toDate(format: "dd MMMM")
            array.append(a)
        }
        if array.contains(DateFormat.tomorrow(day: dateLabel.text ?? "", formatter: "dd MMMM")){
            dateLabel.text = DateFormat.tomorrow(day: dateLabel.text ?? "", formatter: "dd MMMM")
            weekDateLabel.text = DateFormat.tomorrow(day: dateLabel.text ?? "", formatter: "EEEE")
            contentOffSet(index: indexOfDate(date: dateLabel.text ?? ""))
        } else {
            dateLabel.text = dateLabel.text
            weekDateLabel.text = weekDateLabel.text
            contentOffSet(index: indexOfDate(date: dateLabel.text ?? ""))
        }
        
    }
    
    @IBAction func calendarButtonPressed(_ sender: Any) {
        if calendarView.isHidden == true {
            calendarView.isHidden = false
        } else {
            calendarView.isHidden = true
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = UIScreen.main.bounds.width
        let index = Int(scrollView.contentOffset.x / width)
        if calendar.count > index {
            if !((calendar[index]).toDate(format: "dd MMMM")).elementsEqual(currentDate) {
                dateLabel.text = (calendar[index]).toDate(format: "dd MMMM")
                weekDateLabel.text = (calendar[index]).toDate(format: "EEEE")
                calendarView.configure(model: DateFormat(), currentDate: (calendar[index].toDate(format: "dd")))
            }
        }
    }
    
    func changeDateDelegate(tag: Int) {
        dateLabel.text = (calendar[tag]).toDate(format: "dd MMMM")
        weekDateLabel.text = (calendar[tag]).toDate(format: "EEEE")
        calendarView.isHidden = true
        contentOffSet(index: indexOfDate(date: (calendar[tag]).toDate(format: "dd MMMM")))
        calendarView.configure(model: DateFormat(), currentDate: (calendar[tag]).toDate(format: "dd"))
    }
    
    func contentOffSet(index: Int) {
        let width = UIScreen.main.bounds.width
        pagingScroll.contentOffset = CGPoint(x: width * CGFloat(index), y: 0)
    }
    
    func indexOfDate(date: String) -> Int {
        var array: [String] = []
        for i in calendar {
            let a = i.toDate(format: "dd MMMM")
            array.append(a)
        }
        guard let index = array.firstIndex(of: date) else { return 0 }
        return index
    }
}
