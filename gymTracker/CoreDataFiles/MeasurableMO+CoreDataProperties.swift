//
//  MeasurableMO+CoreDataProperties.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 25/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//
//

import Foundation
import CoreData


extension MeasurableMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeasurableMO> {
        return NSFetchRequest<MeasurableMO>(entityName: "Measurable")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String?
}
