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
        request(endpoint: .getQuizes) { [unowned self] result in
            let group = DispatchGroup()
            group.enter()
            switch result {
                case .error(_):
                    break
                case .success(let json):
                    let quizes = JsonParser.shared.parse(json)
                    var details = [JSON]()
                    let semaphore = DispatchSemaphore(value: 1)
                    for quiz in quizes {
                        self.request(endpoint: .getQuestions(forQuizId: quiz.id)) { result in
                            semaphore.wait()
                            switch result {
                            case .error(_):
                                group.leave()
                                break
                            case .success(let json):
                                details.append(json)
                            }
                            semaphore.signal()
                            if quiz == quizes.last! {
                                group.leave()
                            }
                        }
                    }
                    group.notify(queue: .main) {
                        JsonParser.shared.parse(details: details, for: quizes)
                        completion(Result.success(quizes))
                    }
            }
        }
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
