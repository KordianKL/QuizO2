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
    
    var questions: [Question] {
        get {
            return storedQuestions.map { $0 }
        }
        set {
            storedQuestions.removeAll()
            storedQuestions.append(objectsIn: newValue)
        }
    }
    
    var rates: [String] {
        get {
            return storedRates.map { $0 }
        }
        set {
            storedRates.removeAll()
            storedRates.append(objectsIn: newValue)
        }
    }
    
    let storedQuestions = List<Question>()
    let storedRates = List<String>()
    @objc dynamic var progress = 0
    @objc dynamic var id = -1
    @objc dynamic var title = "INITIAL"
    @objc dynamic var content = "INITIAL"
    @objc dynamic var imageUrl = "INITIAL"
    @objc dynamic var category = "INITIAL"
    @objc dynamic var subcategory = "INITIAL"
    @objc dynamic var questionsCount = -1
    @objc dynamic var avgResult = -1.0
    @objc dynamic var resultCount = -1
    @objc dynamic var result = -1.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["questions", "rates"]
    }
}

