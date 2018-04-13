//
//  API.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 13/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation

enum Result<V,E> {
    case success(V)
    case error(E)
}

enum ApiError: String {
    case noResponse = "No response from the server"
    case other = "Other"
}

protocol NetworkGateway {
    
    associatedtype T
    
    func fetchAllItems() -> [Result<T, ApiError>]
}
