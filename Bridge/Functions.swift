//
//  utilites.swift
//  Bridge
//
//  Created by izran khan on 2017-10-16.
//  Copyright © 2017 TechEase. All rights reserved.
//

import Foundation
import UIKit
import Firebase

func changeBorderButton(_ button: UIButton){
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = myBorderColor.cgColor
}

func changeBorderTextField(_ textField: UITextField){
    textField.layer.cornerRadius = 5
    textField.layer.borderWidth = 1
    textField.layer.borderColor = myBorderColor.cgColor
}

func currentUserInfo(){
}


func loginUser(_ email:String, _ password:String){
    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
       
    }
}








