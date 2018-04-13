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
    
    let questions = List<Question>()
    let rates = List<String>()
    @objc dynamic var id = 666
    @objc dynamic var title = "INITIAL"
    @objc dynamic var content = "INITIAL"
    @objc dynamic var imageUrl = "INITIAL"
    @objc dynamic var category = "INITIAL"
    @objc dynamic var subcategory = "INITIAL"
    @objc dynamic var questionsCount = 666
    @objc dynamic var avgResult = 666.666
    @objc dynamic var resultCount = 666
    @objc dynamic var result = 666.666
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

