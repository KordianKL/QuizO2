//
//  Quiz.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 12/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

class Quiz { //Gonna be Realm model, thus needs to be a class
    
    let id: Int = 666
    let title: String = "INITIAL"
    let content: String = "INITIAL"
    let imageUrl: String = "INITIAL"
    let category: String = "INITIAL"
    let subcategory: String = "INITIAL"
    let questionsCount: Int = 666
    let questions: [Question] = []
    let rates: [(Int, Int, String)] = []
    var avgResult: Double = 666.666
    var resultCount: Int = 666
    var result: Double = 666.666
    
}

