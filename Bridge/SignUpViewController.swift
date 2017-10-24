//
//  SignUpViewController.swift
//  Bridge
//
//  Created by izran khan on 2017-10-07.
//  Copyright © 2017 TechEase. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UINavigationControllerDelegate {

    
    @IBOutlet weak var consumerFlag: UISwitch!
    @IBOutlet weak var professionalFlag: UISwitch!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeBorderTextField(emailAddress)
        changeBorderTextField(password)
        changeBorderTextField(confirmPassword)
        changeBorderButton(registerButton)
    }
    
    @IBAction func toggleConsumer(_ sender: Any) {
        consumerFlag.setOn(false, animated: true)
    }
    
    @IBAction func toggleProfessional(_ sender: Any) {
        professionalFlag.setOn(false, animated: true)
    }

    @IBAction func registerAction(){
        let type = consumerFlag.isOn ? typeOfAccount[0] : typeOfAccount[1]
        registerNewUser(emailAddress.text!, password.text!, type)
    }
    
    func registerNewUser(_ email:String, _ password: String,_ type:String){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                print("Error Registering ... \(error.localizedDescription)")
            }
            else{
                // Set the User Type in Database i.e typeOfAccount
                let data = [user?.email,type]
                var ref:DatabaseReference!
                ref = Database.database().reference()
                ref.child("users").childByAutoId().setValue(data)
                self.performSegue(withIdentifier: "setupProfileView", sender: self)
            }
        }
        
    }
}

