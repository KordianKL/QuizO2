//
//  Quiz.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 12/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import RealmSwift

class Quiz: Object {
    
    let id = 666
    let title = "INITIAL"
    let content = "INITIAL"
    let imageUrl = "INITIAL"
    let category = "INITIAL"
    let subcategory = "INITIAL"
    let questionsCount = 666
    let questions: [Question] = []
    let rates: [(Int, Int, String)] = []
    @objc dynamic var avgResult = 666.666
    @objc dynamic var resultCount = 666
    @objc dynamic var result = 666.666
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

