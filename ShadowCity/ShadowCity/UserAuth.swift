//
//  Networking.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 6/18/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkKeys: String {
    case username
    case password
    case token
}

public struct UserAuth {
    public static let host = "http://shadowcitygame.com/api/v1/token/"
    public static var token: String?
    
    public static func currentToken() -> String? {
        if token != nil {
            debugPrint("Found static token")
            return token
        }
        
        if let curT = UserDefaults.standard.string(forKey: NetworkKeys.token.rawValue) {
            debugPrint("Found default token")
            token = curT
            return curT
        }
        
        return nil
    }
    
    public static func token(user: String, pass: String, resultToken: @escaping (String?) -> Void) {
        let params = [NetworkKeys.username.rawValue: user, NetworkKeys.password.rawValue: pass]

        Alamofire.request(host, method: .post, parameters: params).responseJSON { response in
            if let json = response.result.value as? [String: Any],
                let newToken = json[NetworkKeys.token.rawValue] as? String
            {
                debugPrint("New Token from net")
                token = newToken
                save(newToken: newToken)
            }
            
            resultToken(token)
        }
    }
    
    public static func save(newToken: String) {
        UserDefaults.standard.set(newToken, forKey: NetworkKeys.token.rawValue)
    }
}
