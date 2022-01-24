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

    @IBOutlet weak var profileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
    }
    private func registerCell() {
        let profileCell = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        self.profileTableView.register(profileCell, forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "exit", sender: nil)
    }
    

}
extension ProfileViewController: UITableViewDelegate {
    
}
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subTitleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell {
            cell.subTitile.text = subTitleData[indexPath.row]
            cell.mainTitle.text = mainTitleData[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    
}
