//
//  NetworkingEnums.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 6/18/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import Foundation

public struct NetworkResponse {
    public let success: Bool
    public let message: String
    
    public init(success: Bool, message: String) {
        self.success = success
        self.message = message
    }
}

public enum NetworkKeys: String {
    case username
    case password
    case token
}

public enum Endpoint: String {
    case userCreate = "users/"
    case userToken = "token/"
    
    case rollStats = "actors/roll_stats/"
    case listRaces = "actors/list_races/"
    case game = "game/"
}

public struct NetworkUrls {
    public static func baseUrl() -> String {
        #if DEBUG
            return "http://127.0.0.1:8000/"
        #else
            return "http://shadowcitygame.com/"
        #endif
    }
    
    public static func url(with endpoint: Endpoint) -> String {
        return baseUrl() + endpoint.rawValue
    }
}
