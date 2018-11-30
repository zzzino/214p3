//
//  DriverHelper.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/30/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import Foundation

enum DriverHelperResult {
    case Success(String)
    case Failure(Error)
}

class DriverHelper {
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchDriverDescription(for name: String, completion: @escaping (DriverHelperResult) -> Void) {
        let baseUrl = "https://csc214-p3-server.herokuapp.com"
        var components = URLComponents(string: baseUrl)!
        var queryItems = [URLQueryItem]()

        let driverNameParam = URLQueryItem(name: "name", value: name)
        queryItems.append(driverNameParam)
        components.queryItems = queryItems
        let url = components.url!
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) -> Void in
            guard let description = data else {
                completion(.Failure(error!))
                return
            }
            completion(.Success(String(data: description, encoding: .utf8)!))
        }
        task.resume()
        
    }
}
