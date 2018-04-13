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

enum ApiError: Error {
    case noResponse
}

protocol NetworkGateway {
    
    associatedtype T
    
    func fetchAllItems(_ completion: @escaping (Result<T, Error>) -> Void)
}
