//
//  MeasurableManager.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 25/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import Foundation
import CoreData

class MeasurableManager {
    
    let persistenceManager: PersistenceManager
    
    init() {
        self.persistenceManager = PersistenceManager.shared
    }
    
    func create(name: String) -> MeasurableStruct {
        let measurableMO = MeasurableMO(context: persistenceManager.context)
        measurableMO.id = UUID.init()
        measurableMO.name = name
        self.save()
        return MeasurableStruct(measurableMO)
    }
    
    func fetchBy(_ name: String) -> [MeasurableStruct] {
        let measurables = persistenceManager.fetch(MeasurableMO.self, predicate: NSPredicate(format: "name = %@", name))
        if measurables.count == 0 {
            fatalError("No Measurable exists with that name")
        }
        return self.convertModelArrayToStructArray(measurables)
    }
    
    func fetchBy(_ id: UUID) -> [MeasurableStruct] {
        let measurables = persistenceManager.fetch(MeasurableMO.self, predicate: NSPredicate(format: "id = %@", id as CVarArg))
        if measurables.count == 0 {
            fatalError("No Measurable exists with that id")
        }
        return self.convertModelArrayToStructArray(measurables)
    }
    
    func fetchAll(orderByKey: String, ascending: Bool = true) -> [MeasurableStruct] {
        let orderBy = [NSSortDescriptor(key: orderByKey, ascending: ascending, selector: #selector(NSString.caseInsensitiveCompare(_:)))]
        let measurables = persistenceManager.fetchAll(MeasurableMO.self, orderBy: orderBy)
        if measurables.count == 0 {
            return [MeasurableStruct]()
        }
        return self.convertModelArrayToStructArray(measurables)
    }
    
    private func convertModelArrayToStructArray(_ measurableMO: [MeasurableMO]) -> [MeasurableStruct] {
        if measurableMO.count == 0 {
            fatalError("Trying to convert empty array")
        }
        var measurableStructArray = [MeasurableStruct]()
        for mo in measurableMO {
            measurableStructArray.append(MeasurableStruct(mo))
        }
        return measurableStructArray
    }
    
    private func save() {
        persistenceManager.save()
    }
}
