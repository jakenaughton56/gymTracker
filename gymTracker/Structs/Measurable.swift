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
        self.id = measurableMO.id
        self.name = measurableMO.name
    }
    let id: UUID
    var name: String
}
