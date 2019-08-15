//
//  Music+CoreDataProperties.swift
//  fitness video
//
//  Created by EUGENE on 2/22/19.
//  Copyright © 2019 Yauhen Zhloba. All rights reserved.
//
//

import Foundation
import CoreData


extension Music {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Music> {
        return NSFetchRequest<Music>(entityName: "Music")
    }

    @NSManaged public var type: String?

}
