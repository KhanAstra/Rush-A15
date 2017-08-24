//  LoginViewController.swift - Created 8/21/2017
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK: Outlets
    //Email and Password Outlets
    @IBOutlet weak var emailTextFieldLogin: UITextField!
    
    @IBOutlet weak var passwordTextFieldLogin: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting LoginVC as it's own textfield delegate - this is to allow pressing the "Return" button on the keyboard to make the keyboard disappear.
        self.emailTextFieldLogin.delegate = self
        self.passwordTextFieldLogin.delegate = self
        
        //If the user is authenticated, then they will be sent to the tab bar controller.
        Auth.auth().addStateDidChangeListener() { auth, user in
            self.performSegue(withIdentifier: "loginToTabBarSegue", sender: nil)
            }
    }

    
    
    //MARK: Actions
    //Pressing the Login Button sends the email and password to Firebase for authentication.
    
    @IBAction func loginButtonLoginTouched(_ sender: AnyObject) {
        Auth.auth().signIn(withEmail: emailTextFieldLogin.text!,
                               password: passwordTextFieldLogin.text!)
//        print("\(emailTextFieldLogin.text!)")
    }
    
    //Pressing the Signup Button sends the email and password to Firebase to sign the user up.
    
    @IBAction func signUpButtonLoginTouched(_ sender: UIButton) {
        //Imported from LMVP
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
                                        let emailField = alert.textFields![0]
                                        let passwordField = alert.textFields![1]
                                        
                                        Auth.auth().createUser(withEmail: emailField.text!,
                                                                   password: passwordField.text!) { user, error in
                                                                    if error == nil {
                                                                        Auth.auth().signIn(withEmail: self.emailTextFieldLogin.text!,
                                                                                               password: self.passwordTextFieldLogin.text!)
                                                                    }
                                        }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        
        //Sends the emailTextFieldLogin string into textEmail
        alert.addTextField { textEmail in
            textEmail.text = self.emailTextFieldLogin.text!
        }
        
        //Sends the passwordTextFieldLogin string into textPassword
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.text = self.emailTextFieldLogin.text!
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        //End of import LMVPB
        
    }
   
    //Resign first responder status when background is called.
    
    @IBAction func loginBackgroundTapped (_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //Resign first responder status when the "Return" key is pressed on the keyboard.
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    
    
    
    
//Final Brace
}

