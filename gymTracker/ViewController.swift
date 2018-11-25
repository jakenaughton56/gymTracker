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
        let measurable = mgr.create(name: "HeightThree");
        let heightTwo = mgr.fetchBy(measurable.id)
        print(heightTwo[0].name)
        
//        let weight = mgr.fetchMeasurableBy(name: "Weight");
//        print(weight[0].name);
    }
}

