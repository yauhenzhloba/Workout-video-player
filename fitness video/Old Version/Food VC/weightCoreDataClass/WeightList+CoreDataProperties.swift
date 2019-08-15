//
//  WeightList+CoreDataProperties.swift
//  fitness video
//
//  Created by EUGENE on 2/28/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//
//

import Foundation
import CoreData


extension WeightList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeightList> {
        return NSFetchRequest<WeightList>(entityName: "WeightList")
    }

    @NSManaged public var dateString: String?
    @NSManaged public var timestamp: Double
    @NSManaged public var weight: Double

}
