//
//  MeasurableController.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 26/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import UIKit

class MeasurableController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addNewMeasurable() {
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
        }
        let newMeasurableCancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        addNewMeasurableAlert.addAction(newMeasurableSaveButton)
        addNewMeasurableAlert.addAction(newMeasurableCancelButton)
        present(addNewMeasurableAlert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
