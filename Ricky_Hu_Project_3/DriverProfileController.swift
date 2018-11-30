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
    @IBOutlet weak var netDescriptionLabel: UITextView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    let driverHelper = DriverHelper()
    
//    var drivers = [Driver]()
    
    var selectedDriver : Driver? {
        didSet{
            driverHelper.fetchDriverDescription(for: selectedDriver!.name) { result in
                switch result {
                case let .Success(description):
                    OperationQueue.main.addOperation() {
                        self.netDescriptionLabel.text = description
                    }
                case let .Failure(error):
                    print("Error: \(error)")
                }
            }
            reloadInputViews()
        }
    }
    
    @IBAction func swipedDown(_ sender: Any) {
        let newRating = selectedDriver!.myRating - 1
        selectedDriver!.myRating = newRating
        ratingLabel.text = String(newRating)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        driverNameLabel.text = selectedDriver?.name
        if let rating = selectedDriver?.myRating {
            ratingLabel.text = String(rating)
        }
    }

}
