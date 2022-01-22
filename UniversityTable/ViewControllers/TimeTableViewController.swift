//
//  TimeTableViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import UIKit

class TimeTableViewController: UIViewController {

    lazy var dayToday = Date()
    let dataLessons = data
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        dateLabel.text = DateFormat.dateToday(day: dayToday)
        weekDateLabel.text = DateFormat.weekDay(day: dayToday)
    }
    private func registerTableViewCells() {
        let lessonCell = UINib(nibName: "LessonTableViewCell", bundle: nil)
        self.tableView.register(lessonCell, forCellReuseIdentifier: LessonTableViewCell.identifier)
    }
    @IBAction func shareButtonPressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.dataLessons], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        activityVC.activityItemsConfiguration = [UIActivity.ActivityType.message] as? UIActivityItemsConfigurationReading
        activityVC.excludedActivityTypes = [
            UIActivity.ActivityType.airDrop,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.copyToPasteboard,
            UIActivity.ActivityType.markupAsPDF
        ]
        activityVC.isModalInPresentation = true
        self.present(activityVC, animated: true, completion: nil)
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        dateLabel.text = DateFormat.yesterday(day: dateLabel.text!)
        weekDateLabel.text = DateFormat.yesterdayWeek(day: weekDateLabel.text!)
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        dateLabel.text = DateFormat.tomorrow(day: dateLabel.text!)
        weekDateLabel.text = DateFormat.tomorrowWeek(day: weekDateLabel.text!)
    }
    @IBAction func calendarButtonPressed(_ sender: Any) {
        
    }
    
    
}
extension TimeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataLessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LessonTableViewCell.identifier, for: indexPath) as? LessonTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    
}
extension TimeTableViewController: UITableViewDelegate {
    
}
