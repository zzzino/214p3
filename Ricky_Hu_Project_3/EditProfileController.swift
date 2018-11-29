//
//  EditProfileController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/29/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        nameTextField.placeholder = self.defaults.string(forKey: "user_name")
        emailTextField.placeholder = self.defaults.string(forKey: "user_email")
    }
    
    @IBAction func savePressed(_ sender: Any) {
        self.defaults.set(nameTextField.text!, forKey: "user_name")
        self.defaults.set(emailTextField.text!, forKey: "user_email")
        self.navigationController?.popViewController(animated: true)
    }
    
}
