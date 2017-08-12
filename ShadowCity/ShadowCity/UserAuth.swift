//
//  Networking.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 6/18/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import Foundation
import Alamofire

public struct UserAuth {
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
    
    public static func createAccount(user: String, pass: String, result: @escaping (NetworkResponse) -> Void) {
        let params = [NetworkKeys.username.rawValue: user, NetworkKeys.password.rawValue: pass]
        
        Alamofire.request(NetworkUrls.url(with: .userCreate), method: .post, parameters: params).validate().responseJSON { response in
            switch response.result {
            case .success:
                //great, we have success, now make a request to get the token for said account.
                UserAuth.token(user: user, pass: pass, resultToken: { (tokenResponse) in
                    result(tokenResponse)
                })
            case .failure(_):
                logOut()
                result(NetworkResponse(success: false, message: "Account creation failed."))
            }
        }
    }
    
    public static func token(user: String, pass: String, resultToken: @escaping (NetworkResponse) -> Void) {

        let params = [NetworkKeys.username.rawValue: user, NetworkKeys.password.rawValue: pass]

        Alamofire.request(NetworkUrls.url(with: .userToken), method: .post, parameters: params).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value as? [String: Any],
                    let newToken = json[NetworkKeys.token.rawValue] as? String
                {
                    debugPrint("New Token from net")
                    token = newToken
                    save(newToken: newToken)
                    resultToken(NetworkResponse(success: true, message: "Signed in, adventure on."))
                }
            case .failure(_):
                logOut()
                resultToken(NetworkResponse(success: false, message: "Login failed, please try again."))
            }
        }
    }
    
    public static func save(newToken: String?) {
        UserDefaults.standard.set(newToken, forKey: NetworkKeys.token.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    public static func logOut() {
        UserDefaults.standard.removeObject(forKey: NetworkKeys.token.rawValue)
        UserDefaults.standard.synchronize()
        token = nil
    }
}
