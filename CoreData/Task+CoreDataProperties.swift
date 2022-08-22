//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Ffhh Qerg on 22.08.2022.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var author: String?
    @NSManaged public var descript: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var likes: Int64
    @NSManaged public var views: Int64

}
