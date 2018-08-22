//
//  AuthTestVC.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AuthTestVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var taskTextField: UITextField!
    
    var ref: DatabaseReference!
    var addHandle : DatabaseHandle!
    var uid = "0s5NXzruEaQ59WzJFlPyHZy6Yyr2"
    var peopleRef: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        peopleRef = Database.database().reference(withPath: "users")
        
    }
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            print("logged out")
            statusLabel.text = "You are logged out"
            ref.removeAllObservers()
        } catch {
            print("Could not sign out")
        }
        
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: "jon@compton.com", password: "jonjon") { (result, error) in
            if result != nil {
                self.statusLabel.text = "You are logged in"
                //self.uid = result?.user.uid
                
            }
        }
        ref.child("users").child(uid).child("Tasks").observe(.childAdded) { (snapshot) in
            print(snapshot)
        }
        peopleRef = Database.database().reference(withPath: "users").child(uid).child("Tasks")
        peopleRef.keepSynced(true)

    }


    @IBAction func saveTapped(_ sender: Any) {
        print(uid)
        ref.child("users").child(uid).child("Tasks").childByAutoId().setValue("Test value")
        
    }
    

}
