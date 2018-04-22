//
//  ViewModel.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 21/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    
    func didPrepareData()
}

protocol ViewModel: class {
    
    var delegate: ViewModelDelegate? { get set }
    func getItemAt(_ index: Int) -> Quiz
    func getCount() -> Int
    func refreshData()
}
