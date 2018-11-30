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
    @IBOutlet weak var netDescriptionLabel: UILabel!
    
    var selectedDriver : Driver? {
        didSet{
            reloadInputViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDescription()
        driverNameLabel.text = selectedDriver?.name
    }
    
    func fetchDescription() {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let url = getUrl(name: (selectedDriver?.name)!)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    return jsonString
                }
            } else if let requestError = error {
                print("Error \(requestError)")
            } else {
                print("Error case 2")
            }
        }
        task.resume()
    }
    
    func getUrl(name: String) -> URL {
        let baseUrl = "https://csc214-p3-server.herokuapp.com"
        var components = URLComponents(string: baseUrl)!
        var queryItems = [URLQueryItem]()
        
        let driverNameParam = URLQueryItem(name: "name", value: name)
        queryItems.append(driverNameParam)
        
        
        components.queryItems = queryItems
        return components.url!
    }
    
}
