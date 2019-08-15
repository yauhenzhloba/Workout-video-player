//
//  UserWeight+CoreDataProperties.swift
//  fitness video
//
//  Created by EUGENE on 2/28/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//
//

import Foundation
import CoreData


extension UserWeight {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserWeight> {
        return NSFetchRequest<UserWeight>(entityName: "UserWeight")
    }

    @NSManaged public var height: Double
    @NSManaged public var startWeight: Double
    @NSManaged public var targetWeight: Double

}
