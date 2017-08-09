//
//  GameController.swift
//  ShadowCity
//
//  Created by Raphael DeFranco on 8/8/17.
//  Copyright © 2017 Redshirt. All rights reserved.
//

import Foundation
import Alamofire

class GameController {
    static let shared = GameController()
    private let gameStateUrl = "http://127.0.0.1:8000/api/v1/game_state/?lat=102.123&lon=43.234"
    
    public func startPolling() {
        guard let token = UserAuth.currentToken() else { return }
        let headers = ["Authorization": "token \(token)"]
        let params = ["lat": 102.123, "lon": 43.234]
        
        Alamofire.request(gameStateUrl, method: .get, parameters: params, headers: headers)
            .validate().responseJSON { response in
                switch response.result {
                case .success:
                    break
                case .failure(_):
                    break
                }
        }
    }
}
