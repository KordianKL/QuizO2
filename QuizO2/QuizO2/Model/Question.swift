//
//  Question.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 12/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    
    var answers: [Answer] {
        get {
            return storedAnswers.map { $0 }
        }
        set {
            storedAnswers.removeAll()
            storedAnswers.append(objectsIn: newValue)
        }
    }
    
    @objc dynamic var imageUrl: String? = nil
    @objc dynamic var text = "INITIAL"
    let storedAnswers = List<Answer>()
    
    override static func ignoredProperties() -> [String] {
        return ["answers"]
    }
}
