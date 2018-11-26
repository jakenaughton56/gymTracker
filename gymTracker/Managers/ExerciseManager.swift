//
//  ExerciseRepo.swift
//  gymTracker
//
//  Created by Jake Mobile Dev on 18/11/18.
//  Copyright © 2018 JakeMobileDev. All rights reserved.
//

import Foundation
import CoreData

class ExerciseManager {
    
    let persistenceManager: PersistenceManager
    
    init() {
        self.persistenceManager = PersistenceManager.shared
    }
    
    func createExercise(name: String) -> ExerciseMO {
        let exercise = ExerciseMO(context: persistenceManager.context)
        exercise.name = name
        self.save()
        return exercise
    }
    
    func fetchExerciseBy(name: String) -> ExerciseMO {
        let exercise = ExerciseMO(context: persistenceManager.context)
        return exercise
    }
    
    func save() {
        persistenceManager.save()
    }
}
