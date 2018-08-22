//
//  CreateUserVC.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit
import CoreData

class CreateUserVC: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        
    }
    
    @objc func cancelTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addUserTapped(_ sender: Any) {
        guard let username = usernameTextField.text, let email = emailTextField.text, username.count > 0, email.count > 0 else { return }
        if DatabaseService.shared.emailIsUnique(email: email) {
            let newUser = TBUser(context: DatabaseService.shared.context())
            newUser.name = username
            newUser.email = email
            DatabaseService.shared.saveContext()

        } else {
            print("Email in use")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
