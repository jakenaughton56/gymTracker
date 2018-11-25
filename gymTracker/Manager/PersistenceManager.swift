//
//  PersistenceManager.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 18/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
    
    private init() {}
    static let shared = PersistenceManager()
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "gymTracker")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    func save() {
        if context.hasChanges {
            do {
                try context.save()
                print("Saved Successfully")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate) -> [T] {
        let objectString = String(describing: objectType)
        let entityName = objectString.replacingOccurrences(of: "MO", with: "")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = predicate
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(Error.self)
            fatalError("Failed to fetch object")
        }
    }
    
    func fetchAll<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let objectString = String(describing: objectType)
        let entityName = objectString.replacingOccurrences(of: "MO", with: "")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(Error.self)
            fatalError("Failed to fetch object")
        }
    }
}
