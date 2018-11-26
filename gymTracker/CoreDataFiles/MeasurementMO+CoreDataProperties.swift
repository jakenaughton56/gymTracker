//
//  MeasurementMO+CoreDataProperties.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 26/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//
//

import Foundation
import CoreData


extension MeasurementMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeasurementMO> {
        return NSFetchRequest<MeasurementMO>(entityName: "Measurement")
    }

    @NSManaged public var id: UUID
    @NSManaged public var value: String
    @NSManaged public var measurableId: UUID

}
