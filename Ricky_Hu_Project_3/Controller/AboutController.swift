//
//  AboutController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/30/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//
import Foundation
import UIKit

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    var version: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    var build: String? {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    var copyright: String? {
        return object(forInfoDictionaryKey: "NSHumanReadableCopyright") as? String
    }
}

class AboutViewController: UIViewController {
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!
    @IBOutlet weak var buildLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel.text = Bundle.main.displayName
        appVersionLabel.text =  Bundle.main.version
        buildLabel.text = Bundle.main.build
        copyrightLabel.text = Bundle.main.copyright
    }
}
