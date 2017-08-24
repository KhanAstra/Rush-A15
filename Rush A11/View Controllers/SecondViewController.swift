//
//  SecondViewController.swift
//  Rush A11
//

//  Copyright © 2017 Astra. All rights reserved.
//

import UIKit
import FirebaseAuth

class SecondViewController: UIViewController {

    
//   override func viewWillAppear(_ animated: Bool) {
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            // ...
//        }
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        Auth.auth().removeStateDidChangeListener(handle!)
//    }
    @IBOutlet weak var secondLabelSecond: UILabel!

    
    var userInfo = ""
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        
//        handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
//            print(auth)
//            if let user = user {
//                print(user)
//                self.secondLabelSecond.text = "😍 Logged in as \(user.email!)!"
//                print(user.email!)
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
            print(auth)
            if let user = user {
                print(user)
                self.secondLabelSecond.text = "😍 Hi \(user.email!)!"
                print(user.email!)
                print("\(self.userInfo)")
                print(self.userInfo)
            }
        }
         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func logoutButtonSecondPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        } catch {
        }
    }
    
}

