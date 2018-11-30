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
        if (drivers.drivers.count == 0) {
            drivers.addDriver(name: "Dara Kho")
            drivers.write()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if (section == 0) {
            label.text = "Sample Drivers"
        } else {
            label.text = "Your Drivers"
        }
        label.backgroundColor = UIColor.cyan
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        } else {
            return (drivers.drivers.count - 1 < 0 ? 0 : drivers.drivers.count - 1)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath)
        
        let name = indexPath.section == 0 ? drivers.drivers[indexPath.row].name : drivers.drivers[indexPath.row + 1].name
        cell.textLabel?.text = name
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

