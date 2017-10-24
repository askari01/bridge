//
//  ProfileSetupViewController.swift
//  Bridge
//
//  Created by izran khan on 2017-10-16.
//  Copyright © 2017 TechEase. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UINavigationControllerDelegate {

    
    var storageRef: StorageReference!

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var femaleFlag: UISwitch!
    @IBOutlet weak var maleFlag: UISwitch!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        storageRef = Storage.storage().reference()

        // Do any additional setup after loading the view.
    }

    @IBAction func toggleMale(_ sender: Any){
        maleFlag.setOn(false, animated: true)
    }
    
    @IBAction func toggleFemale(_ sender: Any){
        femaleFlag.setOn(false, animated: true)
    }
    
    @IBAction func didTapAddPhoto(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    
    func uploadProfilePhoto(photoData: Data, photo: UIImage) {
        let imagePath = "profile_photos/" + (Auth.auth().currentUser?.uid)! + "/\(Double(Date.timeIntervalSinceReferenceDate*1000)).jpg"
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        storageRef!.child(imagePath).putData(photoData, metadata: metadata){
            (metadata, error) in
            if let error = error{
                print("error uploading: \(error)")
                return
            }
            else{
                self.profileImage.contentMode = .scaleAspectFit
                self.profileImage.image = photo
            }
        }
    }

   

}


extension ProfileViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String:Any]) {
        // constant to hold the information about the photo
        if let photo = info[UIImagePickerControllerOriginalImage] as? UIImage, let photoData = UIImageJPEGRepresentation(photo, 0.8) {
            // call function to upload photo message
            uploadProfilePhoto(photoData: photoData, photo:photo)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

