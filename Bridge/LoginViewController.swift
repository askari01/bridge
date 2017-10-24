//
//  LoginViewController.swift
//  Bridge
//
//  Created by izran khan on 2017-10-06.
//  Copyright © 2017 TechEase. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeBorderButton(loginButton)
        changeBorderTextField(emailAddress)
        changeBorderTextField(password)
    }

    @IBAction func loginAction(){
        if let user = Auth.auth().currentUser
        {
            print("Current User ID: \(user.uid)")
            print("Current User Email: \(user.email)")
            print("Current User Display Name: \(user.displayName)")
        }
        else{
            loginUser(emailAddress.text!, password.text!)
        }
        //performSegue(withIdentifier: "setupProfileView", sender: self)
    }
   
        
}
