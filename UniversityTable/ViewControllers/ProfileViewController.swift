//
//  ProfileViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileData = ProfileData.shared.dataProfile

    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }
    private func registerCell() {
        let profileCell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.profileTableView.register(profileCell, forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }

}
extension ProfileViewController: UITableViewDelegate {
    
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell {
//            let dictItem = Array(profileData)[indexPath.row]
//            let key = dictItem.key
//            let value = dictItem.value
//            cell.mainTitle.text = value
//            cell.subTitile.text = key
            let key = Array(self.profileData.keys)[indexPath.row]
            let value = Array(self.profileData.values)[indexPath.row]
            cell.mainTitle.text = value
            cell.subTitile.text = key
            return cell
        }
        return UITableViewCell()
    }
    
    
}
