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
#warning("Если ты не используешь UITableViewDelegate, выводить его в отдельное расширение не нужно, он в принципе не нужен здесь")
extension MoneyViewController: UITableViewDelegate {
    
}
extension MoneyViewController: UITableViewDataSource {
    
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
            #warning("Когда ячеек станет много и у них у всех будет по 10-20 полей, каждый придётся здесь описывать и увеличивать размер и так, вероятно, большого контроллера. Описывай метод конфигурации ячейки в классе ячейки")
            cell.monthLabel.text = dataMoney[indexPath.row]
            cell.selectedRow = selectedRows.contains(indexPath)
            cell.vectorButtonTapped(UIButton())
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
        #warning("Тоже самое, Swift даёт тебе возможность описывать расширения классов, можно описать метод инициализации цвета в этом расширении, чтобы добавлять туда целое число, а в самом методе пусть происходит это деление на 255, писать станет быстрее и приятнее. Проще же один раз описать и везде потом это использовать")
        config.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        header.backgroundConfiguration = config
        header.backgroundView?.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        header.textLabel?.text = years[section]
        header.backgroundConfiguration?.backgroundColor = UIColor(red: 236 / 255, green: 236 / 255, blue: 236 / 255, alpha: 1)
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
