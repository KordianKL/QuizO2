//
//  MainViewModel.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 21/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

class MainViewModel: ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    private let dataSource: DataSource
    private let networkGateway: NetworkGateway
    
    init(dataSource: DataSource, networkGateway: NetworkGateway, delegate: ViewModelDelegate? = nil) {
        self.dataSource = dataSource
        self.networkGateway = networkGateway
        self.delegate = delegate
    }
    
}
