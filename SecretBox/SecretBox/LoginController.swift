//
//  LoginController.swift
//  SecretBox
//
//  Created by Huy Ly on 11/13/23.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var wrongPass : UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrongPass.isHidden = true

        // Do any additional setup after loading the view.
    }
    func appear()
    {
        wrongPass.isHidden = false //appear
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.wrongPass.isHidden = true//disappear after 1.5s
        }
    }
    @IBAction func loginClicked(_ sender : UIButton)
    {
        
        
        guard let email = userName.text else { return }
        guard let passW = password.text else { return }
        
      
            
        Auth.auth().signIn(withEmail: email, password: passW) { firebaseResult, error in
                if let error = error as NSError?
                {
                    if error.code == AuthErrorCode.wrongPassword.rawValue
                    {
                        
                        print("Wrong password!")
                        // Handle wrong password error here
                    } else {
                        self.wrongPass.text = "Invalid Login"
                        self.appear()
                        print("Error: ")
                        // Handle other errors here
                    }
                } else {
                    self.performSegue(withIdentifier: "toMyBox", sender: self)
                }
            }
    }
    @IBAction func registerClicked(_ sender : UIButton)
    {
        guard let email = userName.text else { return }
        guard let passW = password.text else { return }
         Auth.auth().createUser(withEmail: email, password: passW) { firebaseResult, error in
             if let error = error{
                 print("Error in creating account")
                 self.wrongPass.text = "User existed"
                 self.appear()
             }
             else
             {
                 //alert("Create account successful")
                 self.performSegue(withIdentifier: "toMyBox", sender: self)
             }
         }
        
    }
    

}
