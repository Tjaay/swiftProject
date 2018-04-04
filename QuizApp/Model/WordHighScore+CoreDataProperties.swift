//
//  WordHighScore+CoreDataProperties.swift
//  QuizApp
//
//  Created by Thomas Reeves on 2018-04-04.
//  Copyright © 2018 Thomas Reeves. All rights reserved.
//
//

import Foundation
import CoreData


extension WordHighScore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordHighScore> {
        return NSFetchRequest<WordHighScore>(entityName: "WordHighScore")
    }

    @NSManaged public var name: String?
    @NSManaged public var score: String?
    @NSManaged public var photoID: NSNumber?
    @NSManaged public var highestQuestion: String?

}
