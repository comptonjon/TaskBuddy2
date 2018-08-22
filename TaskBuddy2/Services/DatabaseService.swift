//
//  DatabaseService.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/2/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//

import Foundation
import CoreData

class DatabaseService {
    private init() {}
    
    static let shared = DatabaseService()
    
    // MARK: - Core Data stack
    
    func context() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TaskBuddy2")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func emailIsUnique(email: String) -> Bool {
        let fetchRequest = NSFetchRequest<TBUser>(entityName: "TBUser")
        let filter = email
        fetchRequest.predicate = NSPredicate(format: "email == %@", filter)
        do {
            let results = try context().fetch(fetchRequest) as [TBUser]
            if results.count > 0 {
                return false
            }
        } catch {
            print("Error")
        }
        return true
    }
}
