//
//  DriverProfileController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/29/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import UIKit

class DriverProfileViewController: UIViewController {
    
    @IBOutlet weak var driverNameLabel: UILabel!
    
    var selectedDriver : Driver? {
        didSet{
            reloadInputViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverNameLabel.text = selectedDriver?.name
    }
    
}
