//
//  QuizHandler+Delegate.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 22/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

protocol QuizHandlerDelegate: class {
    
    func didAnswerQuestion(_ number: Int)
    func didFinishQuiz()
}

protocol QuizHandler: class{
    
    var delegate: QuizHandlerDelegate { get set }
}
