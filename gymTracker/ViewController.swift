//
//  ViewController.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 19/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mgr = MeasurableManager()
//        _ = mgr.createMeasureable(name: "Height");
        
        let weight = mgr.fetchMeasurableBy(name: "Height");
        print(weight[0].name);
    }
}

