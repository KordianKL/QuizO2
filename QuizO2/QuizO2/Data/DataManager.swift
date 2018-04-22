//
//  DataManager.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 13/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import RealmSwift

class DataManager: DataSource {
    
    private let realm = try! Realm()
    
    func getAllItems() -> [Quiz] {
        return realm.objects(Quiz.self).compactMap { $0 }
    }
    
    func save(_ items: [Quiz]) {
        try! realm.write {
            for item in items {
                realm.add(item, update: true)
            }
        }
    }
    
    func update(_ item: Quiz) {
        try! realm.write {
            realm.add(item, update: true)
        }
    }
}
