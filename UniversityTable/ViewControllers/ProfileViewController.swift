//
//  ProfileViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let subTitleData = ProfileData.shared.dataSubTitle
    let mainTitleData = ProfileData.shared.dataMainTitle
    let data = ProfileData.shared.arrayOfProfileData

    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }
    //#warning("Не забывай ставить переносы между методами, иначе сложно читается")
    
    private func registerCell() {
        let profileCell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.profileTableView.register(profileCell, forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "exit", sender: nil)
    }
    //#warning("И убирать их там, где они не нужны")
}
//#warning("Если ты не используешь UITableViewDelegate, выводить его в отдельное расширение не нужно, он в принципе не нужен здесь")

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell {
            //#warning("Когда ячеек станет много и у них у всех будет по 10-20 полей, каждый придётся здесь описывать и увеличивать размер и так, вероятно, большого контроллера. Описывай метод конфигурации ячейки в классе ячейки")
            let item = Array(data)[safe: indexPath.row]
            cell.configure(key: item?.key ?? "", value: item?.value ?? "")
            //#warning("Так собирать данные из массива опасно. Посмотри это https://stackoverflow.com/questions/25329186/safe-bounds-checked-array-lookup-in-swift-through-optional-bindings и проверяй, что данные точно есть")
            return cell
        }
        return UITableViewCell()
    }
    
}
extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
