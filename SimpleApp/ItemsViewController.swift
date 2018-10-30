//
//  ItemsViewController.swift
//  SimpleApp
//
//  Created by Mark Nazzaro on 10/29/18.
//  Copyright © 2018 King Ultimat0's Fabulous Creations. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var logStore: LogStore! = LogStore()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logStore.logs.count
    }

    override func tableView(_ tableView: UITableView,
                        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UItableViewCell")
        
        let log = logStore.logs[indexPath.row]
        
        cell.textLabel?.text = "\(log.number)"
        cell.detailTextLabel?.text = log.date
        
        return cell
    }

    @IBAction func addNewItem(_ sender: UIButton) {
        let log = logStore.createLog()
        
        if let index = logStore.logs.index(of: log) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            
            setEditing(false, animated: true)
        }
        else {
            sender.setTitle("Done", for: .normal)
            
            setEditing(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let log = logStore.logs[indexPath.row]
            
            logStore.removeLog(log)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {

        logStore.moveLog(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
}

