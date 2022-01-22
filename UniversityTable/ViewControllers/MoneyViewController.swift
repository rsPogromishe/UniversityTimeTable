//
//  MoneyViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class MoneyViewController: UIViewController {
    
    @IBOutlet weak var moneyTableView: UITableView!
    let years = ["2022", "2021"]
    let month = ["Январь", "Февраль", "Март", "Апрель"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.moneyTableView.separatorStyle = .singleLine
    }
    private func registerCell() {
        let moneyCell = UINib(nibName: "MoneyTableViewCell", bundle: nil)
        self.moneyTableView.register(moneyCell, forCellReuseIdentifier: MoneyTableViewCell.identifier)
    }
}
extension MoneyViewController: UITableViewDelegate {
    
}
extension MoneyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return years.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return years[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return month.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoneyTableViewCell.identifier, for: indexPath) as? MoneyTableViewCell {
            cell.monthLabel.text = month[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
