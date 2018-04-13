//
//  JsonParser.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 13/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import SwiftyJSON

class JsonParser {
    
    public static let shared = JsonParser()
    
    private init() {
        
    }
    
    func parse(_ quizesJson: JSON) -> [Quiz] {
        var quizes = [Quiz]()
        let items = quizesJson["items"].array!
        
        for item in items {
            let quiz = Quiz()
            quiz.id = item["id"].int!
            quiz.category = item["type"].string!
            quiz.subcategory = item["categories"]["name"].string!
            quiz.content = item["content"].string!
            quiz.title = item["title"].string!
            quiz.questionsCount = item["questions"].int!
            quiz.imageUrl = item["mainPhoto"].string!
            quizes.append(quiz)
        }
        
        return quizes
    }
    
    func parse(details: [JSON], for quizes: [Quiz]) {
        for index in 0..<quizes.count {
            let quiz = quizes[index]
            let detail = details[index]
            quiz.questions = parse(details: detail, for: quiz)
            let rates = detail["rates"].array!
            quiz.rates = [
                rates[0]["content"].string!,
                rates[1]["content"].string!,
                rates[2]["content"].string!,
                rates[3]["content"].string!,
                rates[4]["content"].string!
            ]
            quiz.avgResult = detail["avgResult"].double!
            quiz.resultCount = detail["resultCount"].int!
        }
    }
    
    private func parse(details: JSON, for quiz: Quiz) -> [Question] {
        var questions = [Question]()
        
        return questions
    }

    private func parse(details: JSON, for quiz: Quiz) -> [Answer] {
        var answers = [Answer]()
        
        return answers
    }
}
