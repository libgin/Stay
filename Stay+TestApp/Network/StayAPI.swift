//
//  StayAPI.swift
//  Stay+TestApp
//
//  Created by Victor on 21.02.2021.
//

import Foundation
import Moya
import UIKit

enum StayAPI {
    case getHotels(cityID: String)
}

// MARK: - TargetType Protocol Implementation
extension StayAPI: TargetType {
    var baseURL: URL { return URL(string: "https://stage.staystories.me")! }
    
    var path: String {
        switch self {
            case .getHotels(let _):
                return "/api/v10/bcom/dest"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getHotels:
                return .post
        }
    }
    
    var sampleData: Data {
        switch self {
            case .getHotels(let cityID):
                return "{\"city\": \(cityID)}".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
            case .getHotels(cityID: let cityID):
                return .requestParameters(parameters: ["city": cityID], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json" ]
    }
    
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
