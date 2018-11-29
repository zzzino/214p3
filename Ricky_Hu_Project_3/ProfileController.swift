//
//  ProfileController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/29/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        nameLabel.text = self.defaults.string(forKey: "user_name")
        emailLabel.text = self.defaults.string(forKey: "user_email")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = self.defaults.string(forKey: "user_name")
        emailLabel.text = self.defaults.string(forKey: "user_email")
    }
    
}
