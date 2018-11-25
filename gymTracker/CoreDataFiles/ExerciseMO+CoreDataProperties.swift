//
//  ExerciseMO+CoreDataProperties.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 25/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//
//

import Foundation
import CoreData


extension ExerciseMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseMO> {
        return NSFetchRequest<ExerciseMO>(entityName: "Exercise")
    }

    @NSManaged public var name: String?

}
