//
//  ViewController.swift
//  Ricky_Hu_Project_3
//
//  Created by Hu, Ricky Binhai on 11/29/18.
//  Copyright © 2018 Hu, Ricky Binhai. All rights reserved.
//

import UIKit

class DriversViewController: UITableViewController {

    var drivers = ["foo", "bar", "baz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath)
        cell.textLabel?.text = drivers[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        drivers[indexPath.row]
//    }
    
    @IBAction func addDriver(_ sender: UIBarButtonItem) {
        var nameField = UITextField()
        
        let alert = UIAlertController(title: "Add New Driver", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Driver", style: .default) { (action) in
            self.drivers.append(nameField.text!)
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
