//
//  Task+CoreDataProperties.swift
//  TaskBuddy2
//
//  Created by Jonathan Compton on 8/22/18.
//  Copyright © 2018 Jonathan Compton. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var dateDue: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var isComplete: Bool
    @NSManaged public var isUrgent: Bool
    @NSManaged public var lastUpdatedTime: Double
    @NSManaged public var rank: Int32
    @NSManaged public var title: String?
    @NSManaged public var timeCreated: Double
    @NSManaged public var isSynced: Bool
    @NSManaged public var tbUser: TBUser?

}
