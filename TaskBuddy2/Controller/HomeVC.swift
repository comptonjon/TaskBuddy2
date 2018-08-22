//
//  HomeVC.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit
import CoreData

class HomeVC: UIViewController {

    @IBOutlet weak var noCurrentUsersLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var addNewUserButton: UIButton!
    
    var users = [TBUser]()
    let context = DatabaseService.shared.context()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noCurrentUsersLabel.isHidden = false
        userTableView.layer.cornerRadius = 10.0
        userTableView.rowHeight = 60
        userTableView.dataSource = self
        userTableView.delegate = self
        userTableView.layer.opacity = 0
        addNewUserButton.transform = CGAffineTransform(translationX: -500, y: 0)
        UIView.animate(withDuration: 1) {
            self.addNewUserButton.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        UIView.animate(withDuration: 2) {
            self.userTableView.layer.opacity = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fetchRequest = NSFetchRequest<TBUser>(entityName: "TBUser")
        do {
            let results = try context.fetch(fetchRequest) as [TBUser]
            users = results
        } catch {
            print("Error fetching")
        }
        if users.count > 0 {
            noCurrentUsersLabel.isHidden = true
            userTableView.layer.borderWidth = 2
            userTableView.layer.borderColor = UIColor.darkGray.cgColor
        }
        userTableView.reloadData()
    }
    
    @IBAction func addNewUserTapped(_ sender: Any) {
        
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = users[indexPath.row]
        cell.nameLabel.text = user.name
        cell.emailLabel.text = user.email
//        cell.textLabel?.text = user.name
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userTableView.deselectRow(at: indexPath, animated: false)
        let selectedUser = users[indexPath.row]
        TBUserManager.shared.currentTBUser = selectedUser
        performSegue(withIdentifier: "toMasterVCFromHomeVC", sender: nil)
    }
}
