//
//  Studies+CoreDataProperties.swift
//  
//
//  Created by Arttu Jokinen on 22/11/2019.
//
//  Not in Use

import Foundation
import CoreData


extension Studies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Studies> {
        return NSFetchRequest<Studies>(entityName: "Studies")
    }

    @NSManaged public var studyName: NSObject?
    @NSManaged public var studySummary: NSObject?

}
