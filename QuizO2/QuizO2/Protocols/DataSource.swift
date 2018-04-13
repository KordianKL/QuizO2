//
//  DataSource.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 13/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

protocol DataSource {
    
    associatedtype T
    
    func getAllItems() -> [T]
    func save(_ items: T)
}
