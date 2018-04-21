//
//  ViewModel.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 21/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

protocol ViewModelDelegate {
    
    func didPrepareData()
}

protocol ViewModel {
    
    weak var delegate: ViewModelDelegate
}
