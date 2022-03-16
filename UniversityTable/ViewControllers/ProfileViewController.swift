//
//  ProfileViewController.swift
//  UniversityTable
//
//  Created by Снытин Ростислав on 19.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let data = ProfileData.shared.arrayOfProfileData

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

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell {
            //#warning("if let же выше используешь, можно и здесь и его так же")
//            data[safe: indexPath.row] так используется, почитай про subscripts
            let item = data[safe: indexPath.row]
            cell.configure(key: item?.key ?? "", value: item?.value ?? "")
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
