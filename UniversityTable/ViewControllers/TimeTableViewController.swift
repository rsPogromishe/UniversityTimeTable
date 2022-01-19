//
//  TimeTableViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 11.01.2022.
//

import UIKit

class TimeTableViewController: UIViewController {

    lazy var dayToday = Date()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
extension TimeTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
extension TimeTableViewController: UITableViewDelegate {
    
}
