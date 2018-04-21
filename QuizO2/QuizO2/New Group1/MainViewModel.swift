//
//  MainViewModel.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 21/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

class MainViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    private let dataSource: DataSource
    private let networkGateway: NetworkGateway
    private var items: [Quiz] = [Quiz]() {
        didSet {
            delegate?.didPrepareData()
        }
    }
    
    init(dataSource: DataSource, networkGateway: NetworkGateway, delegate: ViewModelDelegate? = nil) {
        self.dataSource = dataSource
        self.networkGateway = networkGateway
        self.delegate = delegate
    }
    
}

extension MainViewModel: ViewModel {
    
    func getItemAt(_ index: Int) -> Quiz {
        return items[index]
    }
    
    func getCount() -> Int {
        return items.count
    }
    
    func refreshData() {
        let items = dataSource.getAllItems()
        if items.count != 0 {
            self.items = items
        } else {
            networkGateway.fetchAllItems { [unowned self] result in
                switch result {
                case .error(let error):
                    NSLog("There was an error fetching data from the network: \(error)")
                case .success(let items):
                    self.dataSource.save(items)
                    self.items = items
                }
            }
        }
    }
}
