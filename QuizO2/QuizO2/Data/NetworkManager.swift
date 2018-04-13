//
//  NetworkManager.swift
//  QuizO2
//
//  Created by Kordian Ledzion on 13/04/2018.
//  Copyright © 2018 KordianLedzion. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

class NetworkManager: NetworkGateway {
    
    private let baseUrl = "http://quiz.o2.pl/api/v1/"
    
    func fetchAllItems(_ completion: @escaping (Result<[Quiz], Error>) -> Void) {
        //TODO: make requests and handle responses
    }
    
    private func request(endpoint: Endpoint, _ completion: @escaping (Result<JSON, Error>) -> Void) {
        Alamofire.request(URL(string: baseUrl + endpoint.url)!).responseSwiftyJSON { dataResponse in
            guard dataResponse.response != nil else {
                completion(Result.error(ApiError.noResponse))
                return
            }
            guard let json = dataResponse.value else {
                completion(Result.error(dataResponse.error!))
                return
            }
            completion(Result.success(json))
        }
    }
    
}

private enum Endpoint {

    case getQuizes
    case getQuestions(forQuizId: Int)

    var url: String {
        switch self {
        case .getQuizes:
            return "quizzes/0/100"
        case .getQuestions(let forQuizId):
            return "quiz/\(forQuizId)/0"
        }
    }
}
