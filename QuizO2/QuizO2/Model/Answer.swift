//
//  Answer.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 12/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import RealmSwift

class Answer: Object {
    
    @objc dynamic var imageUrl: String? = nil
    @objc dynamic var text: String? = nil
    let isCorrect = RealmOptional<Bool>()
    
}
