//
//  DataSource.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 13/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

protocol DataSource: class {
    
    func getAllItems() -> [Quiz]
    func save(_ items: [Quiz])
    func update(_ item: Quiz)
}
