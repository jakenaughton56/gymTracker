//
//  Mesaurable.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 25/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import Foundation

struct MeasurableStruct {
    init(_ measurableMO: MeasurableMO) {
        guard let name = measurableMO.name else {
            fatalError("No MeasureableMO name was passed in.");
        }
        self.name = name
    }
    var name: String
}
