//
//  MeasurableController.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 26/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import UIKit

class MeasurableController: UITableViewController {
    
    let measurableMgr = MeasurableManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Measurables"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addMeasurable))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "blah")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: switch measurable manager to handle count.
        let measurableList = measurableMgr.fetchAll(orderByKey: "id")
        return measurableList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "blah", for: indexPath)
        
        let measurableList = measurableMgr.fetchAll(orderByKey: "name")
        cell.textLabel?.text = measurableList[indexPath.row].name
        return cell
    }
    
    @objc func addMeasurable() {
        let addNewMeasurableAlert = UIAlertController(title: "Add New Measurable", message: nil, preferredStyle: .alert)
        addNewMeasurableAlert.addTextField { (newMeasurable) in
            newMeasurable.placeholder = "Enter name"
        }
        let newMeasurableSaveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let textField = addNewMeasurableAlert.textFields?.first?.text else {
                fatalError("No Text Field in Add New Measurable Alert")
            }
            if textField.isEmpty {
                let warningAlert = UIAlertController(title: nil, message: "Did not enter a name.", preferredStyle: .alert)
                let warningCancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                warningAlert.addAction(warningCancelButton)
                self.present(warningAlert, animated: true, completion: nil)
                return
            }
            let measurableMgr = MeasurableManager()
            let newMeasurable = measurableMgr.create(name: textField)
            let newMeasurableAddedAlert = UIAlertController(title: nil, message: "New Measurable: \(newMeasurable.name) was added.", preferredStyle: .alert)
            let newMeasurableAddedOkButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            newMeasurableAddedAlert.addAction(newMeasurableAddedOkButton)
            self.present(newMeasurableAddedAlert, animated: true, completion: nil)
            self.tableView.reloadData()
        }
        let newMeasurableCancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addNewMeasurableAlert.addAction(newMeasurableSaveButton)
        addNewMeasurableAlert.addAction(newMeasurableCancelButton)
        present(addNewMeasurableAlert, animated: true, completion: nil)
    }
}
