//
//  ViewController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/29/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import UIKit

class DriversViewController: UITableViewController {

    var drivers = DriverList()
//    var drivers = [Driver]()
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Drivers.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drivers.load()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.drivers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath)
        cell.textLabel?.text = drivers.drivers[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDriver", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDriver") {
            let destinationController = segue.destination as! DriverProfileViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.selectedDriver = drivers.drivers[indexPath.row]
                destinationController.drivers = drivers
            }
        }
    }
    
    
    @IBAction func addDriver(_ sender: UIBarButtonItem) {
        var nameField = UITextField()
        
        let alert = UIAlertController(title: "Add New Driver", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Driver", style: .default) { (action) in
            self.drivers.addDriver(name: nameField.text!)
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

