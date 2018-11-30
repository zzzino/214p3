//
//  File.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/30/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import Foundation

class DriverList: Codable {
    var drivers: [Driver] = []
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Drivers.plist")

    func addDriver(name: String) -> Void {
        let driver = Driver()
        driver.name = name
        self.drivers.append(driver)
        self.write()
    }

    func load() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                self.drivers = try decoder.decode([Driver].self, from: data)
            } catch {
                print("Failed to decode drivers \(error)")
            }
        }
    }

    func write() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.drivers)
            try data.write(to: dataFilePath!)
        } catch {
            print("Failed to encode drivers, \(error)")
        }
    }
}
