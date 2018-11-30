//
//  ViewController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/29/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import UIKit

class DriversViewController: UITableViewController {

    var drivers = [Driver]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Drivers.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstDriver = Driver()
        firstDriver.name = "Zino Sama"
        drivers.append(firstDriver)
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                drivers = try decoder.decode([Driver].self, from: data)
            } catch {
                print("Failed to decode drivers \(error)")
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath)
        cell.textLabel?.text = drivers[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDriver", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDriver") {
            let destinationController = segue.destination as! DriverProfileViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.selectedDriver = drivers[indexPath.row]
            }
        }
    }
    
    
    @IBAction func addDriver(_ sender: UIBarButtonItem) {
        var nameField = UITextField()
        
        let alert = UIAlertController(title: "Add New Driver", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Driver", style: .default) { (action) in
            
            let driver = Driver()
            driver.name = nameField.text!
            self.drivers.append(driver)
            
            let encoder = PropertyListEncoder()
            do {
                let data = try encoder.encode(self.drivers)
                try data.write(to: self.dataFilePath!)
            } catch {
                print("Failed to encode drivers, \(error)")
            }
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Name of your driver"
            nameField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

