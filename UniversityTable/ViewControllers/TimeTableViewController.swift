//
//  TimeTableViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import UIKit

#warning("не забывай про safeArea, UIView наехала на статус бар айфона с челкой")
#warning("Выводи UIView c логикой, чем показ обычный просмотр в отдельный класс")
class TimeTableViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var dayToday = Date()
    
    let dataLessons = data
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekDateLabel: UILabel!
    
    @IBOutlet weak var pagingScroll: UIScrollView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("Настройку одной вьюхи компонуй в один блок кода")
        pagingScroll.delegate = self
        dateLabel.text = DateFormat.dateToday(day: dayToday)
        weekDateLabel.text = DateFormat.weekDay(day: dayToday)
        datePicker.isHidden = true
        
        pagingScroll.isPagingEnabled = true
        pagingScroll.alwaysBounceVertical = false
        let numberOfPages: Int = 3
        let heightScroll = UIScreen.main.bounds.height - (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0) - (self.tabBarController?.tabBar.frame.height ?? 0) - 67
        let widthScroll = UIScreen.main.bounds.width
        self.pagingScroll.contentSize = CGSize(width: widthScroll * 4,
                                               height: 0)
        
        for i in 0...numberOfPages {
            let frame: CGRect = CGRect(x: widthScroll * CGFloat(i), y: 0, width: widthScroll, height: heightScroll)
            let tableview = TimeTableView.init(frame: frame)
            pagingScroll.addSubview(tableview)
        }
    }
    #warning("Не забывай ставить переносы между методами, иначе сложно читается")
    @IBAction func shareButtonPressed(_ sender: Any) {
        let sharedData = "Пары на \(self.dateLabel.text!)(\(self.weekDateLabel.text!))"
        let activityVC = UIActivityViewController(activityItems: [sharedData], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        dateLabel.text = DateFormat.yesterday(day: dateLabel.text!)
        weekDateLabel.text = DateFormat.yesterdayWeek(day: weekDateLabel.text!)
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        dateLabel.text = DateFormat.tomorrow(day: dateLabel.text!)
        weekDateLabel.text = DateFormat.tomorrowWeek(day: weekDateLabel.text!)
//        pagingScroll.
    }
    @IBAction func calendarButtonPressed(_ sender: Any) {
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.isHidden = false
        datePicker.datePickerMode = .date
        datePicker.date = dayToday
    }
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "dd MMMM"
        format.locale = Locale(identifier: "ru_RU")
        dateLabel.text = format.string(from: sender.date)
        let formater = DateFormatter()
        formater.dateFormat = "EEEE"
        formater.locale = Locale(identifier: "ru_RU")
        weekDateLabel.text = formater.string(from: sender.date)
    }
    
    
}
