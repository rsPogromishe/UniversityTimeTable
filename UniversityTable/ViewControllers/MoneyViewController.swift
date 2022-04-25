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
    let dataMoney = DataMoneyDate.shared.month
    var selectedRows: [IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        moneyTableView.sectionHeaderTopPadding = 0
    }
    
    private func registerCell() {
        let moneyCell = UINib(nibName: "MoneyTableViewCell", bundle: nil)
        self.moneyTableView.register(moneyCell, forCellReuseIdentifier: MoneyTableViewCell.identifier)
    }
}

extension MoneyViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return years.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 12
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoneyTableViewCell.identifier, for: indexPath) as? MoneyTableViewCell {
            cell.configure(month: dataMoney[indexPath.row])
            cell.selectedRow = selectedRows.contains(indexPath)
            cell.vectorButtonTapped()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedRows.contains(indexPath) {
            selectedRows.removeAll { indexPath1 in
                if indexPath1 == indexPath {
                    return true
                } else {
                    return false
                }
            }
        } else {
            selectedRows.append(indexPath)
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedRows.contains(indexPath) {
            return 121
        }
        return 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView()
        var config = UIBackgroundConfiguration.clear()
        config.backgroundColor = UIColor.setColor(red: 236, green: 236, blue: 236, alpha: 1)
        header.backgroundConfiguration = config
        header.backgroundView?.backgroundColor = UIColor.setColor(red: 236, green: 236, blue: 236, alpha: 1)
        header.textLabel?.text = years[section]
        header.backgroundConfiguration?.backgroundColor = UIColor.setColor(red: 236, green: 236, blue: 236, alpha: 1)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
